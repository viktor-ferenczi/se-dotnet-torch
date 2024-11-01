using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using NLog;
using Sandbox.Engine.Multiplayer;
using Sandbox.Game.World;
using Torch.API.Managers;
using Torch.Managers.PatchManager;
using Torch.Managers.PatchManager.MSIL;
using Torch.Managers.PatchManager.Transpile;
using Torch.Server.Managers;
using Torch.Utils;
using VRage.Game.ModAPI;

namespace Torch.Patches
{
    [PatchShim]
    public static class ServerResponsePatch
    {
        private static Logger _log = LogManager.GetCurrentClassLogger();

        public static void Patch(PatchContext ctx)
        {
            var transpiler = typeof(ServerResponsePatch).GetMethod(nameof(Transpile), BindingFlags.Public | BindingFlags.Static);
            ctx.GetPattern(typeof(MyDedicatedServerBase).GetMethod("Initialize", BindingFlags.NonPublic | BindingFlags.Instance))
               .Transpilers.Add(transpiler);
            _log.Info("Patching Steam response polling");
        }

        public static IEnumerable<MsilInstruction> Transpile(IEnumerable<MsilInstruction> instructions, LoggingIlGenerator gen)
        {
            var msil = instructions.ToList();
            msil.RecordOriginalCode(gen);
            
            // Reduce response timeout from 1000 seconds to 5 seconds.
            for (var i = 0; i < msil.Count; i++)
            {
                var instruction = msil[i];
                if (instruction.OpCode == OpCodes.Ldc_I4 && instruction.Operand is MsilOperandInline.MsilOperandInt32 inlineI32 && inlineI32.Value == 1000)
                {
                    _log.Info("Patching Steam response timeout to 5 seconds");
                    inlineI32.Value = 50;
                    break;
                }
            }
            
            msil.RecordPatchedCode(gen);
            return msil;
        }
    }
}