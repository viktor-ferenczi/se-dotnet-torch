nop
[EX_BeginException]
nop
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_ServerPasswordSalt()
call static System.Byte[] System.Convert::FromBase64String(System.String s)
pop
nop
leave.s L2
[EX_BeginCatch]
stloc.s 5
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldloca.s 6
ldc.i4.s 0
ldc.i4.2
call System.Void System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::.ctor(System.Int32 literalLength, System.Int32 formattedCount)
ldloca.s 6
ldstr "Invalid ServerPasswordSalt: "
call System.Void System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendLiteral(System.String value)
nop
ldloca.s 6
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_ServerPasswordSalt()
call System.Void System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendFormatted(System.String value)
nop
ldloca.s 6
ldstr " Exception: "
call System.Void System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendLiteral(System.String value)
nop
ldloca.s 6
ldloc.s 5
call System.Void System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendFormatted(System.FormatException value)
nop
ldloca.s 6
call System.String System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::ToStringAndClear()
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
[EX_EndException]
leave L3
L2:
ldarg.0
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.UInt64 VRage.Game.ModAPI.IMyConfigDedicated::get_GroupID()
call System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::set_GroupId(System.UInt64 value)
nop
ldarg.0
ldc.i4.0
call System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::set_ServerStarted(System.Boolean value)
nop
ldarg.0
ldarg.0
callvirt abstract virtual System.Int32 Sandbox.Engine.Multiplayer.MyMultiplayerBase::get_MaxPlayers()
callvirt abstract virtual System.Void Sandbox.Engine.Multiplayer.MyMultiplayerBase::SetMemberLimit(System.Int32 limit)
nop
call static VRage.GameServices.IMyPeer2Peer Sandbox.Engine.Networking.MyGameService::get_Peer2Peer()
ldarg.0
ldftn System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::Peer2Peer_SessionRequest(System.UInt64 remoteUserId)
newobj System.Void System.Action`1<System.UInt64>::.ctor(System.Object object, System.IntPtr method)
callvirt abstract virtual System.Void VRage.GameServices.IMyPeer2Peer::add_SessionRequest(System.Action`1<System.UInt64> value)
nop
call static VRage.GameServices.IMyPeer2Peer Sandbox.Engine.Networking.MyGameService::get_Peer2Peer()
ldarg.0
ldftn System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::Peer2Peer_ConnectionFailed(System.UInt64 remoteUserId, System.String error)
newobj System.Void System.Action`2<System.UInt64, System.String>::.ctor(System.Object object, System.IntPtr method)
callvirt abstract virtual System.Void VRage.GameServices.IMyPeer2Peer::add_ConnectionFailed(System.Action`2<System.UInt64, System.String> value)
nop
ldarg.0
ldarg.0
ldftn System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::MyDedicatedServer_ClientLeft(System.UInt64 user, VRage.GameServices.MyChatMemberStateChangeEnum arg2)
newobj System.Void System.Action`2<System.UInt64, VRage.GameServices.MyChatMemberStateChangeEnum>::.ctor(System.Object object, System.IntPtr method)
call System.Void Sandbox.Engine.Multiplayer.MyMultiplayerBase::add_ClientLeft(System.Action`2<System.UInt64, VRage.GameServices.MyChatMemberStateChangeEnum> value)
nop
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldarg.0
ldftn System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::GameServer_ServersConnected()
newobj System.Void System.Action::.ctor(System.Object object, System.IntPtr method)
callvirt abstract virtual System.Void VRage.GameServices.IMyGameServer::add_PlatformConnected(System.Action value)
nop
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldarg.0
ldftn System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::GameServer_ServersConnectFailure(System.String result)
newobj System.Void System.Action`1<System.String>::.ctor(System.Object object, System.IntPtr method)
callvirt abstract virtual System.Void VRage.GameServices.IMyGameServer::add_PlatformConnectionFailed(System.Action`1<System.String> value)
nop
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldarg.0
ldftn System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::GameServer_ServersDisconnected(System.String result)
newobj System.Void System.Action`1<System.String>::.ctor(System.Object object, System.IntPtr method)
callvirt abstract virtual System.Void VRage.GameServices.IMyGameServer::add_PlatformDisconnected(System.Action`1<System.String> value)
nop
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldarg.0
ldftn System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::GameServer_PolicyResponse(System.SByte result)
newobj System.Void System.Action`1<System.SByte>::.ctor(System.Object object, System.IntPtr method)
callvirt abstract virtual System.Void VRage.GameServices.IMyGameServer::add_PolicyResponse(System.Action`1<System.SByte> value)
nop
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldarg.0
ldftn System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::GameServer_ValidateAuthTicketResponse(System.UInt64 steamID, VRage.Network.JoinResult response, System.UInt64 steamOwner, System.String serviceName)
newobj System.Void System.Action`4<System.UInt64, VRage.Network.JoinResult, System.UInt64, System.String>::.ctor(System.Object object, System.IntPtr method)
callvirt abstract virtual System.Void VRage.GameServices.IMyGameServer::add_ValidateAuthTicketResponse(System.Action`4<System.UInt64, VRage.Network.JoinResult, System.UInt64, System.String> value)
nop
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldarg.0
ldftn System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::GameServer_UserGroupStatus(System.UInt64 userId, System.UInt64 groupId, System.Boolean member, System.Boolean officier)
newobj System.Void System.Action`4<System.UInt64, System.UInt64, System.Boolean, System.Boolean>::.ctor(System.Object object, System.IntPtr method)
callvirt abstract virtual System.Void VRage.GameServices.IMyGameServer::add_UserGroupStatusResponse(System.Action`4<System.UInt64, System.UInt64, System.Boolean, System.Boolean> value)
nop
ldarg.0
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_ServerName()
dup
stloc.s 7
callvirt abstract virtual System.Void Sandbox.Engine.Multiplayer.MyMultiplayerBase::set_HostName(System.String value)
nop
ldloc.s 7
stloc.0
ldloc.0
call static System.Boolean System.String::IsNullOrWhiteSpace(System.String value)
stloc.s 8
ldloc.s 8
brfalse.s L4
nop
ldstr "Unnamed server"
stloc.0
nop
L4:
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldloc.0
callvirt abstract virtual System.Void VRage.GameServices.IMyGameServer::SetServerName(System.String serverName)
nop
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldarg.1
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.Int32 VRage.Game.ModAPI.IMyConfigDedicated::get_SteamPort()
conv.u2
ldsfld VRage.Utils.MyVersion VRage.Game.MyFinalBuildConstants::APP_VERSION
callvirt virtual System.String System.Object::ToString()
callvirt abstract virtual System.Boolean VRage.GameServices.IMyGameServer::Start(System.Net.IPEndPoint serverEndpoint, System.UInt16 steamPort, System.String versionString)
stloc.1
call static VRage.GameServices.IMyPeer2Peer Sandbox.Engine.Networking.MyGameService::get_Peer2Peer()
ldc.i4.1
callvirt abstract virtual System.Void VRage.GameServices.IMyPeer2Peer::SetServer(System.Boolean server)
nop
ldloc.1
ldc.i4.0
ceq
stloc.s 9
ldloc.s 9
brfalse.s L5
nop
br L6
L5:
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldsfld System.String Sandbox.Game.MyPerGameSettings::SteamGameServerGameDir
callvirt abstract virtual System.Void VRage.GameServices.IMyGameServer::SetModDir(System.String directory)
nop
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldsfld System.String Sandbox.Game.MyPerGameSettings::SteamGameServerDescription
callvirt abstract virtual System.Void VRage.GameServices.IMyGameServer::set_GameDescription(System.String value)
nop
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldc.i4.1
callvirt abstract virtual System.Void VRage.GameServices.IMyGameServer::SetDedicated(System.Boolean isDedicated)
nop
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_ServerPasswordHash()
call static System.Boolean System.String::IsNullOrEmpty(System.String value)
brtrue.s L7
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_ServerPasswordSalt()
call static System.Boolean System.String::IsNullOrEmpty(System.String value)
ldc.i4.0
ceq
br.s L8
L7:
ldc.i4.0
L8:
stloc.s 10
ldloc.s 10
brfalse.s L9
nop
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldc.i4.1
callvirt abstract virtual System.Void VRage.GameServices.IMyGameServer::SetPasswordProtected(System.Boolean passwdProtected)
nop
ldarg.0
ldc.i4.1
call System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::set_IsPasswordProtected(System.Boolean value)
nop
nop
L9:
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
callvirt abstract virtual System.Void VRage.GameServices.IMyGameServer::LogOnAnonymous()
nop
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldc.i4.1
callvirt abstract virtual System.Void VRage.GameServices.IMyGameServer::EnableHeartbeats(System.Boolean enable)
nop
ldarg.0
call System.UInt64 Sandbox.Engine.Multiplayer.MyDedicatedServerBase::get_GroupId()
brfalse.s L10
ldarg.0
call System.UInt64 Sandbox.Engine.Multiplayer.MyDedicatedServerBase::get_GroupId()
call static VRage.GameServices.MyGameServiceAccountType Sandbox.Engine.Networking.MyGameService::GetServerAccountType(System.UInt64 steamId)
ldc.i4.7
ceq
ldc.i4.0
ceq
br.s L11
L10:
ldc.i4.0
L11:
stloc.s 11
ldloc.s 11
brfalse.s L12
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "Specified group ID is invalid: "
ldarg.0
call System.UInt64 Sandbox.Engine.Multiplayer.MyDedicatedServerBase::get_GroupId()
stloc.s 12
ldloca.s 12
call virtual System.String System.UInt64::ToString()
call static System.String System.String::Concat(System.String str0, System.String str1)
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
nop
L12:
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
ldc.i4 10000
callvirt abstract virtual System.Boolean VRage.GameServices.IMyGameServer::WaitStart(System.Int32 timeOut)
ldc.i4.0
ceq
stloc.s 13
ldloc.s 13
brfalse.s L13
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "Error: No IP assigned."
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
br L14
L13:
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
callvirt abstract virtual System.UInt64 VRage.GameServices.IMyGameServer::get_ServerId()
call static System.Void Sandbox.Engine.Networking.MyGameService::set_UserId(System.UInt64 value)
nop
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
callvirt abstract virtual System.UInt32 VRage.GameServices.IMyGameServer::GetPublicIP()
stloc.2
ldloc.2
call static System.Net.IPAddress System.Net.IPAddressExtensions::FromIPv4NetworkOrder(System.UInt32 ip)
stloc.3
ldarg.0
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
callvirt abstract virtual System.UInt64 VRage.GameServices.IMyGameServer::get_ServerId()
call System.Void Sandbox.Engine.Multiplayer.MyMultiplayerBase::set_ServerId(System.UInt64 value)
nop
ldarg.0
call VRage.Network.MyReplicationServer Sandbox.Engine.Multiplayer.MyMultiplayerServerBase::get_ReplicationLayer()
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
callvirt abstract virtual System.UInt64 VRage.GameServices.IMyGameServer::get_ServerId()
newobj System.Void VRage.Network.EndpointId::.ctor(System.UInt64 value)
callvirt System.Void VRage.Network.MyReplicationLayerBase::SetLocalEndpoint(VRage.Network.EndpointId localEndpoint)
nop
ldarg.0
ldfld System.Collections.Generic.List`1<System.UInt64> Sandbox.Engine.Multiplayer.MyDedicatedServerBase::m_members
ldarg.0
call System.UInt64 Sandbox.Engine.Multiplayer.MyMultiplayerBase::get_ServerId()
callvirt virtual System.Void System.Collections.Generic.List`1<System.UInt64>::Add(System.UInt64 item)
nop
ldarg.0
ldarg.0
call System.UInt64 Sandbox.Engine.Multiplayer.MyMultiplayerBase::get_ServerId()
ldloca.s 14
initobj Sandbox.Engine.Multiplayer.MyMultiplayerBase+MyConnectedClientData
ldloca.s 14
ldsfld VRage.Utils.MyStringId Sandbox.Game.Localization.MySpaceTexts::ChatBotName
call static System.String VRage.MyTexts::GetString(VRage.Utils.MyStringId id)
stfld System.String Sandbox.Engine.Multiplayer.MyConnectedClientData::Name
ldloca.s 14
ldc.i4.1
stfld System.Boolean Sandbox.Engine.Multiplayer.MyConnectedClientData::IsAdmin
ldloca.s 14
ldsfld VRage.Utils.MyStringId Sandbox.Game.Localization.MySpaceTexts::ChatBotName
call static System.String VRage.MyTexts::GetString(VRage.Utils.MyStringId id)
stfld System.String Sandbox.Engine.Multiplayer.MyConnectedClientData::PlatformName
ldloc.s 14
call System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::MemberDataAdd(System.UInt64 steamId, Sandbox.Engine.Multiplayer.MyConnectedClientData data)
nop
ldarg.0
ldfld Sandbox.Game.Multiplayer.MySyncLayer Sandbox.Engine.Multiplayer.MyMultiplayerBase::SyncLayer
ldarg.0
callvirt System.Void Sandbox.Game.Multiplayer.MySyncLayer::RegisterClientEvents(Sandbox.Engine.Multiplayer.MyMultiplayerBase multiplayer)
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "Networking service: "
call static VRage.GameServices.IMyNetworking Sandbox.Engine.Networking.MyGameService::get_Networking()
callvirt abstract virtual System.String VRage.GameServices.IMyNetworking::get_ServiceName()
call static System.String System.String::Concat(System.String str0, System.String str1)
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "Server successfully started"
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "Product name: "
call static VRage.GameServices.IMyNetworking Sandbox.Engine.Networking.MyGameService::get_Networking()
callvirt abstract virtual System.String VRage.GameServices.IMyNetworking::get_ProductName()
call static System.String System.String::Concat(System.String str0, System.String str1)
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "Desc: "
call static VRage.GameServices.IMyGameServer Sandbox.Engine.Networking.MyGameService::get_GameServer()
callvirt abstract virtual System.String VRage.GameServices.IMyGameServer::get_GameDescription()
call static System.String System.String::Concat(System.String str0, System.String str1)
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "Public IP: "
ldloc.2
brfalse.s L15
ldloc.3
callvirt virtual System.String System.Object::ToString()
br.s L16
L15:
ldstr "Undisclosed"
L16:
call static System.String System.String::Concat(System.String str0, System.String str1)
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "User ID: "
call static System.UInt64 Sandbox.Engine.Networking.MyGameService::get_UserId()
call static System.String VRage.Network.EndpointId::Format(System.UInt64 endpointId)
call static System.String System.String::Concat(System.String str0, System.String str1)
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
ldc.i4 1000
stloc.s 4
br.s L17
L20:
nop
call static System.Void Sandbox.Engine.Networking.MyGameService::Update()
nop
ldc.i4.s 0
call static System.Void System.Threading.Thread::Sleep(System.Int32 millisecondsTimeout)
nop
ldloc.s 4
ldc.i4.1
sub
stloc.s 4
nop
L17:
ldarg.0
call System.Boolean Sandbox.Engine.Multiplayer.MyDedicatedServerBase::get_HasServerResponded()
brtrue.s L18
ldloc.s 4
ldc.i4.0
cgt
br.s L19
L18:
ldc.i4.0
L19:
stloc.s 15
ldloc.s 15
brtrue.s L20
ldarg.0
ldc.i4.1
call System.Void Sandbox.Engine.Multiplayer.MyDedicatedServerBase::set_ServerStarted(System.Boolean value)
nop
L3:
L6:
L14:
ret
