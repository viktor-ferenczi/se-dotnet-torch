﻿using Torch.Managers.PatchManager.Transpile;
using Label = System.Reflection.Emit.Label;

namespace Torch.Managers.PatchManager.MSIL
{
    /// <summary>
    ///     Represents an abstract label, identified by its reference.
    /// </summary>
    public class MsilLabel
    {
        private readonly List<KeyValuePair<WeakReference<LoggingIlGenerator>, Label>> _labelInstances =
            new List<KeyValuePair<WeakReference<LoggingIlGenerator>, Label>>();

        internal readonly Label? OverrideLabel;

        /// <summary>
        ///     Creates an empty label the allocates a new <see cref="Label" /> when requested.
        /// </summary>
        public MsilLabel()
        {
            OverrideLabel = null;
        }

        /// <summary>
        ///     Creates a label the always supplies the given <see cref="Label" />
        /// </summary>
        public MsilLabel(Label overrideLabel)
        {
            OverrideLabel = overrideLabel;
        }

        /// <summary>
        ///     Creates a label that supplies the given <see cref="Label" /> when a label for the given generator is requested,
        ///     otherwise it creates a new label.
        /// </summary>
        /// <param name="generator">Generator to register the label on</param>
        /// <param name="label">Label to register</param>
        public MsilLabel(LoggingIlGenerator generator, Label label)
        {
            _labelInstances.Add(
                new KeyValuePair<WeakReference<LoggingIlGenerator>, Label>(
                    new WeakReference<LoggingIlGenerator>(generator), label));
        }

        internal Label LabelFor(LoggingIlGenerator gen)
        {
            if (OverrideLabel.HasValue)
                return OverrideLabel.Value;
            foreach (KeyValuePair<WeakReference<LoggingIlGenerator>, Label> kv in _labelInstances)
                if (kv.Key.TryGetTarget(out LoggingIlGenerator gen2) && gen2 == gen)
                    return kv.Value;
            Label label = gen.DefineLabel();
            _labelInstances.Add(
                new KeyValuePair<WeakReference<LoggingIlGenerator>, Label>(new WeakReference<LoggingIlGenerator>(gen),
                    label));
            return label;
        }

        /// <inheritdoc />
        public override string ToString()
        {
            return $"L{GetHashCode() & 0xFFFF:X4}";
        }
    }
}