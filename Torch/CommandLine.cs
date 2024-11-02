﻿using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using NLog;

namespace Torch
{
    /// <summary>
    /// Base class that adds tools for setting type properties through the command line.
    /// </summary>
    public abstract class CommandLine
    {
        private readonly string _argPrefix;
        private readonly Dictionary<ArgAttribute, PropertyInfo> _args = new Dictionary<ArgAttribute, PropertyInfo>();
        private readonly Logger _log = LogManager.GetCurrentClassLogger();

        protected CommandLine(string argPrefix = "-")
        {
            _argPrefix = argPrefix;
            foreach (var prop in GetType().GetProperties())
            {
                if (prop.HasAttribute<ArgAttribute>())
                    _args.Add(prop.GetCustomAttribute<ArgAttribute>(), prop);
            }
        }

        public string GetHelp()
        {
            var sb = new StringBuilder();

            foreach (var property in _args)
            {
                var attr = property.Key;
                sb.AppendLine($"{_argPrefix}{attr.Name.PadRight(24)}{attr.Description}");
            }

            return sb.ToString();
        }

        public override string ToString()
        {
            var args = new List<string>();
            foreach (var prop in _args)
            {
                var attr = prop.Key;
                if (prop.Value.PropertyType == typeof(bool) && (bool)prop.Value.GetValue(this))
                {
                    args.Add($"{_argPrefix}{attr.Name}");
                }
                else if (prop.Value.PropertyType == typeof(string))
                {
                    var str = (string)prop.Value.GetValue(this);
                    if (string.IsNullOrEmpty(str))
                        continue;
                    args.Add($"{_argPrefix}{attr.Name} \"{str}\"");
                }
            }

            return string.Join(" ", args);
        }

        public bool Parse(string[] args)
        {
            if (args.Length == 0)
                return true;

            if (args[0] == $"{_argPrefix}help")
            {
                Console.WriteLine(GetHelp());
                return false;
            }

            for (var i = 0; i < args.Length; i++)
            {
                if (!args[i].StartsWith(_argPrefix))
                    continue;

                foreach (var property in _args)
                {
                    var argName = property.Key.Name;
                    if (argName == null)
                        continue;

                    try
                    {
                        if (string.Compare(argName, 0, args[i], 1, argName.Length, StringComparison.InvariantCultureIgnoreCase) == 0)
                        {
                            if (property.Value.PropertyType == typeof(bool))
                                property.Value.SetValue(this, true);

                            if (property.Value.PropertyType == typeof(string))
                                property.Value.SetValue(this, args[++i]);

                            if (property.Value.PropertyType == typeof(List<Guid>))
                            {
                                i++;
                                var l = new List<Guid>(16);
                                while (i < args.Length && !args[i].StartsWith(_argPrefix))
                                {
                                    if (Guid.TryParse(args[i], out Guid g))
                                    {
                                        l.Add(g);
                                        _log.Info($"added plugin {g}");
                                    }
                                    else
                                        _log.Warn($"Failed to parse GUID {args[i]}");
                                    i++;
                                }
                                property.Value.SetValue(this, l);
                            }
                        }
                    }
                    catch
                    {
                        Console.WriteLine($"Error parsing arg {argName}");
                    }
                }
            }

            return true;

        }

        public class ArgAttribute : Attribute
        {
            public string Name { get; }
            public string Description { get; }
            public ArgAttribute(string name, string description)
            {
                Name = name;
                Description = description;
            }
        }
    }
}
