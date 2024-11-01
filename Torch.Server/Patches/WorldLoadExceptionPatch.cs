using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using System.Windows.Documents;
using HarmonyLib;
using NLog;
using Sandbox;
using Torch.Managers.PatchManager;
using Torch.Managers.PatchManager.MSIL;
using Torch.Managers.PatchManager.Transpile;
using Torch.Utils;

namespace Torch.Patches
{
    /// <summary>
    /// Patches MySandboxGame.InitQuickLaunch to rethrow exceptions caught during session load.
    /// </summary>
    [PatchShim]
    public static class WorldLoadExceptionPatch
    {
        private static readonly ILogger _log = LogManager.GetCurrentClassLogger();
        
        public static void Patch(PatchContext ctx)
        {
            ctx.GetPattern(typeof(MySandboxGame).GetMethod("InitQuickLaunch", BindingFlags.Instance | BindingFlags.NonPublic))
               .Transpilers.Add(typeof(WorldLoadExceptionPatch).GetMethod(nameof(Transpile), BindingFlags.Static | BindingFlags.NonPublic));
        }

        private static IEnumerable<MsilInstruction> Transpile(IEnumerable<MsilInstruction> method, LoggingIlGenerator gen)
        {
            var msil = method.ToList();
            msil.RecordOriginalCode(gen);

            for (var i = 0; i < msil.Count; i++)
            {
                var instruction = msil[i];
                if (instruction.OpCode == OpCodes.Stloc_S &&
                    instruction.Operand is MsilOperandInline.MsilOperandLocal operand &&
                    operand.Value.Type.FullName == "System.Exception")
                {
                    msil.InsertRange(i + 1, new[]
                    {
                        new MsilInstruction(OpCodes.Ldloc_S).InlineValue(operand.Value),
                        new MsilInstruction(OpCodes.Call).InlineValue(new Action<Exception>(LogFatal).Method)
                    });
                    break;
                }
            }

            msil.RecordPatchedCode(gen);
            return msil;
        }

        public static void LogFatal(Exception e) => _log.Fatal(e.ToStringDemystified());
    }
}