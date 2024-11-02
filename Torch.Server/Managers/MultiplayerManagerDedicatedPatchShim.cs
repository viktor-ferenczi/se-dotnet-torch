﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NLog;
using Sandbox.Engine.Multiplayer;
using Torch.Managers.PatchManager;
using Torch.API.Managers;

namespace Torch.Server.Managers
{
    [PatchShim]
    internal static class MultiplayerManagerDedicatedPatchShim
    {
        public static void Patch(PatchContext ctx)
        {
            ctx.GetPattern(typeof(MyDedicatedServerBase).GetMethod(nameof(MyDedicatedServerBase.BanClient))).Prefixes.Add(typeof(MultiplayerManagerDedicatedPatchShim).GetMethod(nameof(BanPrefix)));
            ctx.GetPattern(typeof(MyMultiplayerServerBase).GetMethod(nameof(MyMultiplayerServerBase.KickClient))).Prefixes.Add(typeof(MultiplayerManagerDedicatedPatchShim).GetMethod(nameof(KickPrefix)));
        }

        public static void BanPrefix(ulong userId, bool banned)
        {
            TorchBase.Instance.CurrentSession.Managers.GetManager<MultiplayerManagerDedicated>().RaiseClientBanned(userId, banned);
        }

        public static void KickPrefix(ulong userId)
        {
            TorchBase.Instance.CurrentSession.Managers.GetManager<MultiplayerManagerDedicated>().RaiseClientKicked(userId);
        }
    }
}
