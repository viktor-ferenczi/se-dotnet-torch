newobj System.Void Sandbox.<>c__DisplayClass180_0::.ctor()
stloc.0
ldloc.0
ldarg.0
stfld Sandbox.MySandboxGame Sandbox.<>c__DisplayClass180_0::<>4__this
nop
call static VRage.IVRagePlatform VRage.MyVRage::get_Platform()
callvirt abstract virtual VRage.IVRageWindows VRage.IVRagePlatform::get_Windows()
callvirt abstract virtual VRage.IVRageWindow VRage.IVRageWindows::get_Window()
ldnull
cgt.un
stloc.s 4
ldloc.s 4
brfalse.s L0
nop
call static VRage.IVRagePlatform VRage.MyVRage::get_Platform()
callvirt abstract virtual VRage.IVRageWindows VRage.IVRagePlatform::get_Windows()
callvirt abstract virtual VRage.IVRageWindow VRage.IVRageWindows::get_Window()
callvirt abstract virtual System.Void VRage.IVRageWindow::ShowAndFocus()
nop
nop
L0:
newobj System.Void Sandbox.Engine.Networking.CancelToken::.ctor()
stloc.1
ldloca.s 2
initobj System.Nullable`1[VRage.Game.MyQuickLaunchType]
ldarg.0
ldc.i4.1
ldnull
call System.Void Sandbox.MySandboxGame::InitCloud(System.Boolean syncLoad, System.Action onDone)
nop
call static System.Void VRageRender.MyRenderProxy::InitSubsystemConsume()
nop
call static VRage.GameServices.MyUGCAggregator Sandbox.Engine.Networking.MyGameService::get_WorkshopService()
ldstr "mod.io"
callvirt VRage.GameServices.IMyUGCService VRage.GameServices.MyUGCAggregator::GetAggregate(System.String serviceName)
stloc.3
ldloc.3
ldnull
cgt.un
stloc.s 5
ldloc.s 5
brfalse.s L1
nop
ldloc.3
ldsfld Sandbox.Engine.Utils.MyConfig Sandbox.MySandboxGame::Config
callvirt System.Boolean Sandbox.Engine.Utils.MyConfig::get_ModIoConsent()
callvirt abstract virtual System.Void VRage.GameServices.IMyUGCService::set_IsConsentGiven(System.Boolean value)
nop
nop
L1:
ldloc.0
ldnull
stfld System.Text.StringBuilder Sandbox.<>c__DisplayClass180_0::errorMsg
ldarg.0
ldflda System.Nullable`1<System.UInt64> Sandbox.MySandboxGame::m_joinLobbyId
call System.Boolean System.Nullable`1<System.UInt64>::get_HasValue()
stloc.s 6
ldloc.s 6
brfalse.s L2
nop
ldarg.0
ldflda System.Nullable`1<System.UInt64> Sandbox.MySandboxGame::m_joinLobbyId
call System.UInt64 System.Nullable`1<System.UInt64>::get_Value()
call static VRage.GameServices.IMyLobby Sandbox.Engine.Networking.MyGameService::CreateLobby(System.UInt64 lobbyId)
stloc.s 7
ldloc.s 7
callvirt abstract virtual System.Boolean VRage.GameServices.IMyLobby::get_IsValid()
stloc.s 8
ldloc.s 8
brfalse.s L3
nop
ldloc.s 7
ldc.i4.1
call static System.Void Sandbox.Game.Gui.MyJoinGameHelper::JoinGame(VRage.GameServices.IMyLobby lobby, System.Boolean requestData)
nop
ldc.i4.1
stloc.s 9
br L4
L3:
ldloc.0
ldsfld VRage.Utils.MyStringId MyCommonTexts::LobbyDoesntExist
call static System.Text.StringBuilder VRage.MyTexts::Get(VRage.Utils.MyStringId id)
stfld System.Text.StringBuilder Sandbox.<>c__DisplayClass180_0::errorMsg
nop
L2:
ldarg.0
ldfld System.String Sandbox.MySandboxGame::m_launchScenarioInstance
ldnull
cgt.un
stloc.s 10
ldloc.s 10
brfalse.s L5
nop
call static Sandbox.Game.MyCampaignManager Sandbox.Game.MyCampaignManager::get_Static()
ldarg.0
ldfld System.String Sandbox.MySandboxGame::m_launchScenarioInstance
ldc.i4.1
ldarg.0
ldfld System.Boolean Sandbox.MySandboxGame::m_launchScenarioCrossPlatform
callvirt System.Boolean Sandbox.Game.MyCampaignManager::RunCampaign(System.String path, System.Boolean runAsInstance, System.Boolean crossPlatform)
stloc.s 11
ldloc.s 11
brfalse.s L6
nop
ldc.i4.1
stloc.s 9
br L7
L6:
ldloc.0
ldsfld VRage.Utils.MyStringId MyCommonTexts::MessageBoxTextLoadWorldError
call static System.Text.StringBuilder VRage.MyTexts::Get(VRage.Utils.MyStringId id)
stfld System.Text.StringBuilder Sandbox.<>c__DisplayClass180_0::errorMsg
nop
L5:
call static System.Boolean Sandbox.Engine.Networking.MyGameService::get_CanQuickLaunch()
stloc.s 12
ldloc.s 12
brfalse.s L8
nop
ldsfld Sandbox.MySandboxGame Sandbox.MySandboxGame::Static
callvirt System.UInt32 Sandbox.MySandboxGame::get_IntroVideoId()
call static System.Void VRageRender.MyRenderProxy::CloseVideo(System.UInt32 id)
nop
call static System.Void Sandbox.Graphics.GUI.MyGuiSandbox::BackToMainMenu()
nop
call static System.Void Sandbox.Engine.Networking.MyGameService::QuickLaunch()
nop
ldc.i4.1
stloc.s 9
br L9
L8:
ldarg.0
ldfld System.String Sandbox.MySandboxGame::m_launchScenario
ldnull
cgt.un
stloc.s 13
ldloc.s 13
brfalse.s L10
nop
call static Sandbox.Game.MyCampaignManager Sandbox.Game.MyCampaignManager::get_Static()
ldarg.0
ldfld System.String Sandbox.MySandboxGame::m_launchScenario
ldc.i4.0
ldarg.0
ldfld System.Boolean Sandbox.MySandboxGame::m_launchScenarioCrossPlatform
callvirt System.Boolean Sandbox.Game.MyCampaignManager::RunCampaign(System.String path, System.Boolean runAsInstance, System.Boolean crossPlatform)
stloc.s 14
ldloc.s 14
brfalse.s L11
nop
ldc.i4.1
stloc.s 9
br L12
L11:
ldloc.0
ldsfld VRage.Utils.MyStringId MyCommonTexts::MessageBoxTextLoadWorldError
call static System.Text.StringBuilder VRage.MyTexts::Get(VRage.Utils.MyStringId id)
stfld System.Text.StringBuilder Sandbox.<>c__DisplayClass180_0::errorMsg
nop
L10:
ldloca.s 2
call System.Boolean System.Nullable`1<VRage.Game.MyQuickLaunchType>::get_HasValue()
brfalse.s L13
ldsfld System.Boolean Sandbox.Engine.Platform.Game::IsDedicated
brtrue.s L14
ldsfld System.String Sandbox.Engine.Platform.Game::ConnectToServer
call static System.Boolean System.String::IsNullOrEmpty(System.String value)
br.s L15
L13:
L14:
ldc.i4.0
L15:
stloc.s 15
ldloc.s 15
brfalse.s L16
nop
ldloca.s 2
call VRage.Game.MyQuickLaunchType System.Nullable`1<VRage.Game.MyQuickLaunchType>::get_Value()
stloc.s 16
ldloc.s 16
ldc.i4.1
cgt
stloc.s 17
ldloc.s 17
brfalse.s L17
nop
newobj System.Void System.InvalidBranchException::.ctor()
throw
L17:
ldloca.s 2
call VRage.Game.MyQuickLaunchType System.Nullable`1<VRage.Game.MyQuickLaunchType>::get_Value()
ldsfld VRage.Utils.MyStringId MyCommonTexts::StartGameInProgressPleaseWait
newobj System.Void Sandbox.Game.Gui.MyGuiScreenStartQuickLaunch::.ctor(VRage.Game.MyQuickLaunchType quickLaunchType, VRage.Utils.MyStringId progressText)
call static System.Void Sandbox.Graphics.GUI.MyGuiSandbox::AddScreen(Sandbox.Graphics.GUI.MyGuiScreenBase screen)
nop
nop
br.s L18
L16:
ldsfld System.Boolean Sandbox.Game.MyPlatformGameSettings::ENABLE_LOGOS
stloc.s 18
ldloc.s 18
brfalse.s L19
nop
ldloc.0
ldftn System.Void Sandbox.<>c__DisplayClass180_0::<InitQuickLaunch>b__0()
newobj System.Void System.Action::.ctor(System.Object object, System.IntPtr method)
call static System.Void Sandbox.Graphics.GUI.MyGuiSandbox::BackToIntroLogos(System.Action afterLogosAction)
nop
call static System.Boolean Sandbox.Game.Screens.MyGuiScreenInitialLoading::CloseInstance()
pop
nop
br.s L20
L19:
nop
ldarg.0
call System.Void Sandbox.MySandboxGame::ShowIntroMessages()
nop
ldloc.0
callvirt System.Void Sandbox.<>c__DisplayClass180_0::<InitQuickLaunch>g__ShowErrorMessageBox|1()
nop
nop
L18:
L20:
ldsfld System.Boolean Sandbox.Engine.Platform.Game::IsDedicated
stloc.s 19
ldloc.s 19
brfalse L21
nop
ldc.i4.0
stloc.s 20
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_WorldName()
call static System.Boolean System.String::IsNullOrWhiteSpace(System.String value)
stloc.s 21
ldloc.s 21
brfalse.s L22
nop
ldsfld VRage.Utils.MyStringId MyCommonTexts::DefaultSaveName
call static System.Text.StringBuilder VRage.MyTexts::Get(VRage.Utils.MyStringId id)
call static System.DateTime System.DateTime::get_Now()
stloc.s 22
ldloca.s 22
ldstr "yyyy-MM-dd HH:mm"
call System.String System.DateTime::ToString(System.String format)
call static System.String System.String::Concat(System.Object arg0, System.Object arg1)
pop
nop
br.s L23
L22:
nop
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_WorldName()
callvirt System.String System.String::Trim()
pop
nop
L23:
nop
[EX_BeginException]
nop
call static System.String Sandbox.Engine.Networking.MyLocalCache::GetLastSessionPath()
stloc.s 23
ldsfld System.Boolean Sandbox.Engine.Platform.Game::IgnoreLastSession
brtrue.s L24
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.Boolean VRage.Game.ModAPI.IMyConfigDedicated::get_IgnoreLastSession()
brtrue.s L25
ldloc.s 23
ldnull
cgt.un
br.s L26
L24:
L25:
ldc.i4.0
L26:
stloc.s 24
ldloc.s 24
brfalse L27
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "Loading last session "
ldloc.s 23
call static System.String System.String::Concat(System.String str0, System.String str1)
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
ldloc.s 23
ldloca.s 25
ldloca.s 28
initobj System.Nullable`1[VRage.Library.Utils.MyGameModeEnum]
ldloc.s 28
ldloca.s 29
initobj System.Nullable`1[VRage.Game.MyOnlineModeEnum]
ldloc.s 29
call static VRage.Game.MyObjectBuilder_Checkpoint Sandbox.Engine.Networking.MyLocalCache::LoadCheckpoint(System.String sessionDirectory, System.UInt64& sizeInBytes, System.Nullable`1<VRage.Library.Utils.MyGameModeEnum> forceGameMode, System.Nullable`1<VRage.Game.MyOnlineModeEnum> forceOnlineMode)
stloc.s 26
ldloc.s 26
ldnull
ceq
stloc.s 30
ldloc.s 30
brfalse.s L28
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "LoadCheckpoint failed."
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
ldsfld Sandbox.MySandboxGame Sandbox.MySandboxGame::Static
callvirt System.Void Sandbox.Engine.Platform.Game::Exit()
nop
ldc.i4.0
stloc.s 9
leave L29
L28:
ldloc.s 26
ldfld VRage.Game.MyObjectBuilder_SessionSettings VRage.Game.MyObjectBuilder_Checkpoint::Settings
ldfld System.Int16 VRage.Game.MyObjectBuilder_SessionSettings::MaxPlayers
ldc.i4.0
ceq
stloc.s 31
ldloc.s 31
brfalse.s L30
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "Server can not start. Max Players is 0."
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
ldsfld Sandbox.MySandboxGame Sandbox.MySandboxGame::Static
callvirt System.Void Sandbox.Engine.Platform.Game::Exit()
nop
ldc.i4.0
stloc.s 9
leave L31
L30:
ldloc.s 26
call static System.Boolean Sandbox.Game.World.MySession::IsCompatibleVersion(VRage.Game.MyObjectBuilder_Checkpoint checkpoint)
ldc.i4.0
ceq
stloc.s 32
ldloc.s 32
brfalse.s L32
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldsfld VRage.Utils.MyStringId MyCommonTexts::DialogTextIncompatibleWorldVersion
call static System.Text.StringBuilder VRage.MyTexts::Get(VRage.Utils.MyStringId id)
callvirt virtual System.String System.Object::ToString()
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
ldsfld Sandbox.MySandboxGame Sandbox.MySandboxGame::Static
callvirt System.Void Sandbox.Engine.Platform.Game::Exit()
nop
ldc.i4.0
stloc.s 9
leave L33
L32:
ldloc.s 26
call static System.Boolean Sandbox.Game.World.MySessionLoader::HasOnlyModsFromConsentedUGCs(VRage.Game.MyObjectBuilder_Checkpoint checkpoint)
ldc.i4.0
ceq
stloc.s 33
ldloc.s 33
brfalse.s L34
nop
ldloc.s 26
call static System.String Sandbox.Game.World.MySessionLoader::GetNonConsentedServiceNameInCheckpoint(VRage.Game.MyObjectBuilder_Checkpoint checkpoint)
call static System.Void Sandbox.Game.World.MySessionLoader::ShowUGCConsentNotAcceptedWarning(System.String serviceName)
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "LoadCheckpoint failed. No UGC consent."
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
ldsfld Sandbox.MySandboxGame Sandbox.MySandboxGame::Static
callvirt System.Void Sandbox.Engine.Platform.Game::Exit()
nop
ldc.i4.0
stloc.s 9
leave L35
L34:
ldloc.s 26
ldfld System.Collections.Generic.List`1<VRage.Game.ModItem> VRage.Game.MyObjectBuilder_Checkpoint::Mods
ldloc.1
call static Sandbox.Engine.Networking.ResultData Sandbox.Engine.Networking.MyWorkshop::DownloadWorldModsBlocking(System.Collections.Generic.List`1<VRage.Game.ModItem> mods, Sandbox.Engine.Networking.CancelToken cancelToken)
stloc.s 27
ldloc.s 27
ldfld VRage.GameServices.MyGameServiceCallResult Sandbox.Engine.Networking.ResultData::Result
ldc.i4.1
ceq
ldc.i4.0
ceq
stloc.s 34
ldloc.s 34
brfalse.s L36
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldc.i4.s 0
ldc.i4.1
newobj System.Void System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::.ctor(System.Int32 literalLength, System.Int32 formattedCount)
stloc.s 35
ldloca.s 35
ldstr "Unable to download mods. Result = "
call System.Void System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendLiteral(System.String value)
nop
ldloca.s 35
ldloc.s 27
ldfld VRage.GameServices.MyGameServiceCallResult Sandbox.Engine.Networking.ResultData::Result
call System.Void System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendFormatted(VRage.GameServices.MyGameServiceCallResult value)
nop
ldloca.s 35
call System.String System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::ToStringAndClear()
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
ldsfld Sandbox.MySandboxGame Sandbox.MySandboxGame::Static
callvirt System.Void Sandbox.Engine.Platform.Game::Exit()
nop
ldc.i4.0
stloc.s 9
leave L37
L36:
call static Sandbox.Engine.Analytics.MySpaceAnalytics Sandbox.Engine.Analytics.MySpaceAnalytics::get_Instance()
call static Sandbox.Engine.Analytics.MySpaceAnalytics Sandbox.Engine.Analytics.MySpaceAnalytics::get_Instance()
ldfld Sandbox.Engine.Analytics.MyWorldEntryEnum Sandbox.Engine.Analytics.MySpaceAnalytics::WorldEntryUsed
callvirt System.Void Sandbox.Engine.Analytics.MySpaceAnalytics::SetWorldEntry(Sandbox.Engine.Analytics.MyWorldEntryEnum entry)
nop
ldloc.s 23
ldloc.s 26
ldloc.s 25
ldc.i4.1
ldc.i4.1
call static System.Void Sandbox.Game.World.MySession::Load(System.String sessionPath, VRage.Game.MyObjectBuilder_Checkpoint checkpoint, System.UInt64 checkpointSizeInBytes, System.Boolean saveLastStates, System.Boolean allowXml)
nop
call static Sandbox.Game.World.MySession Sandbox.Game.World.MySession::get_Static()
call static Sandbox.Engine.Multiplayer.MyMultiplayerBase Sandbox.Engine.Multiplayer.MyMultiplayer::get_Static()
callvirt System.Void Sandbox.Game.World.MySession::StartServer(Sandbox.Engine.Multiplayer.MyMultiplayerBase multiplayer)
nop
nop
br L38
L27:
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_LoadWorld()
call static System.Boolean System.String::IsNullOrEmpty(System.String value)
ldc.i4.0
ceq
stloc.s 36
ldloc.s 36
brfalse L39
nop
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_LoadWorld()
stloc.s 37
ldloc.s 37
call static System.Boolean System.IO.Path::IsPathRooted(System.String path)
ldc.i4.0
ceq
stloc.s 38
ldloc.s 38
brfalse.s L40
nop
call static System.String VRage.FileSystem.MyFileSystem::get_SavesPath()
ldloc.s 37
call static System.String System.IO.Path::Combine(System.String path1, System.String path2)
stloc.s 37
nop
L40:
ldloc.s 37
call static System.Boolean System.IO.Path::HasExtension(System.String path)
brfalse.s L41
ldloc.s 37
call static System.Boolean System.IO.File::Exists(System.String path)
br.s L42
L41:
ldc.i4.0
L42:
stloc.s 39
ldloc.s 39
brfalse.s L43
nop
ldloc.s 37
call static System.String System.IO.Path::GetDirectoryName(System.String path)
stloc.s 37
nop
L43:
ldloc.s 37
call static System.Boolean System.IO.Directory::Exists(System.String path)
stloc.s 40
ldloc.s 40
brfalse.s L44
nop
ldloc.s 37
ldloc.1
ldnull
call static System.Boolean Sandbox.Game.World.MySessionLoader::LoadDedicatedSession(System.String sessionPath, Sandbox.Engine.Networking.CancelToken cancelToken, System.Action afterLoad)
pop
nop
br.s L45
L44:
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "World "
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_LoadWorld()
call static System.String System.IO.Path::GetFileName(System.String path)
ldstr " not found."
call static System.String System.String::Concat(System.String str0, System.String str1, System.String str2)
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "Creating new one with same name"
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
ldc.i4.1
stloc.s 20
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_LoadWorld()
call static System.String System.IO.Path::GetFileName(System.String path)
pop
nop
L45:
nop
br.s L46
L39:
nop
ldc.i4.1
stloc.s 20
nop
L38:
L46:
ldloc.s 20
stloc.s 41
ldloc.s 41
brfalse L47
nop
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual VRage.Game.MyObjectBuilder_SessionSettings VRage.Game.ModAPI.IMyConfigDedicated::get_SessionSettings()
stloc.s 42
ldloc.s 42
ldfld System.Int16 VRage.Game.MyObjectBuilder_SessionSettings::MaxPlayers
ldc.i4.0
ceq
stloc.s 43
ldloc.s 43
brfalse.s L48
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "Server can not start. Max Players is 0."
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
ldsfld Sandbox.MySandboxGame Sandbox.MySandboxGame::Static
callvirt System.Void Sandbox.Engine.Platform.Game::Exit()
nop
ldc.i4.0
stloc.s 9
leave L49
L48:
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_PremadeCheckpointPath()
callvirt System.String System.String::ToLower()
ldstr ".scf"
callvirt System.Boolean System.String::EndsWith(System.String value)
stloc.s 44
ldloc.s 44
brfalse.s L50
nop
call static Sandbox.Game.MyCampaignManager Sandbox.Game.MyCampaignManager::get_Static()
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_PremadeCheckpointPath()
ldc.i4.1
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.Boolean VRage.Game.ModAPI.IMyConfigDedicated::get_CrossPlatform()
callvirt System.Boolean Sandbox.Game.MyCampaignManager::RunCampaign(System.String path, System.Boolean runAsInstance, System.Boolean crossPlatform)
pop
nop
br L51
L50:
nop
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_PremadeCheckpointPath()
stloc.s 45
ldloc.s 45
call static System.Boolean System.IO.Path::HasExtension(System.String path)
stloc.s 51
ldloc.s 51
brfalse.s L52
nop
ldloc.s 45
call static System.String System.IO.Path::GetDirectoryName(System.String path)
stloc.s 45
nop
L52:
ldloc.s 45
call static System.Boolean VRage.FileSystem.MyFileSystem::DirectoryExists(System.String path)
ldc.i4.0
ceq
stloc.s 52
ldloc.s 52
brfalse.s L53
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "Cannot start new world - Premade world not found "
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_PremadeCheckpointPath()
call static System.String System.String::Concat(System.String str0, System.String str1)
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
ldsfld Sandbox.MySandboxGame Sandbox.MySandboxGame::Static
callvirt System.Void Sandbox.Engine.Platform.Game::Exit()
nop
ldc.i4.0
stloc.s 9
leave L54
L53:
ldloc.s 45
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.Boolean VRage.Game.ModAPI.IMyConfigDedicated::get_CrossPlatform()
ldloca.s 46
ldnull
call static System.String Sandbox.Engine.Networking.MyLocalCache::GetSessionPathFromScenario(System.String path, System.Boolean forceConsoleCompatible, System.Boolean& isCompatible, System.String pathToContentDir)
stloc.s 47
ldloc.s 47
call static System.Boolean System.String::IsNullOrEmpty(System.String value)
stloc.s 53
ldloc.s 53
brfalse.s L55
nop
ldloc.s 45
stloc.s 47
nop
L55:
ldloc.s 47
call static System.Boolean System.IO.Path::HasExtension(System.String path)
stloc.s 54
ldloc.s 54
brfalse.s L56
nop
ldloc.s 47
call static System.String System.IO.Path::GetDirectoryName(System.String path)
stloc.s 47
nop
L56:
ldloc.s 47
ldloca.s 48
ldloca.s 28
initobj System.Nullable`1[VRage.Library.Utils.MyGameModeEnum]
ldloc.s 28
ldloca.s 29
initobj System.Nullable`1[VRage.Game.MyOnlineModeEnum]
ldloc.s 29
call static VRage.Game.MyObjectBuilder_Checkpoint Sandbox.Engine.Networking.MyLocalCache::LoadCheckpoint(System.String sessionDirectory, System.UInt64& sizeInBytes, System.Nullable`1<VRage.Library.Utils.MyGameModeEnum> forceGameMode, System.Nullable`1<VRage.Game.MyOnlineModeEnum> forceOnlineMode)
stloc.s 49
ldloc.s 49
ldnull
ceq
stloc.s 55
ldloc.s 55
brfalse.s L57
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "LoadCheckpoint failed."
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
ldsfld Sandbox.MySandboxGame Sandbox.MySandboxGame::Static
callvirt System.Void Sandbox.Engine.Platform.Game::Exit()
nop
ldc.i4.0
stloc.s 9
leave L58
L57:
ldloc.s 49
call static System.Boolean Sandbox.Game.World.MySessionLoader::HasOnlyModsFromConsentedUGCs(VRage.Game.MyObjectBuilder_Checkpoint checkpoint)
ldc.i4.0
ceq
stloc.s 56
ldloc.s 56
brfalse.s L59
nop
ldloc.s 49
call static System.String Sandbox.Game.World.MySessionLoader::GetNonConsentedServiceNameInCheckpoint(VRage.Game.MyObjectBuilder_Checkpoint checkpoint)
call static System.Void Sandbox.Game.World.MySessionLoader::ShowUGCConsentNotAcceptedWarning(System.String serviceName)
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "LoadCheckpoint failed. No UGC consent."
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
ldsfld Sandbox.MySandboxGame Sandbox.MySandboxGame::Static
callvirt System.Void Sandbox.Engine.Platform.Game::Exit()
nop
ldc.i4.0
stloc.s 9
leave L60
L59:
ldloc.s 49
ldloc.s 42
stfld VRage.Game.MyObjectBuilder_SessionSettings VRage.Game.MyObjectBuilder_Checkpoint::Settings
ldloc.s 49
ldsfld VRage.Game.ModAPI.IMyConfigDedicated Sandbox.MySandboxGame::ConfigDedicated
callvirt abstract virtual System.String VRage.Game.ModAPI.IMyConfigDedicated::get_WorldName()
stfld System.String VRage.Game.MyObjectBuilder_Checkpoint::SessionName
ldloc.s 49
ldfld System.Collections.Generic.List`1<VRage.Game.ModItem> VRage.Game.MyObjectBuilder_Checkpoint::Mods
ldloc.1
call static Sandbox.Engine.Networking.ResultData Sandbox.Engine.Networking.MyWorkshop::DownloadWorldModsBlocking(System.Collections.Generic.List`1<VRage.Game.ModItem> mods, Sandbox.Engine.Networking.CancelToken cancelToken)
ldfld VRage.GameServices.MyGameServiceCallResult Sandbox.Engine.Networking.ResultData::Result
stloc.s 50
ldloc.s 50
ldc.i4.1
ceq
ldc.i4.0
ceq
stloc.s 57
ldloc.s 57
brfalse.s L61
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldc.i4.s 0
ldc.i4.1
newobj System.Void System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::.ctor(System.Int32 literalLength, System.Int32 formattedCount)
stloc.s 35
ldloca.s 35
ldstr "Unable to download mods. Result = "
call System.Void System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendLiteral(System.String value)
nop
ldloca.s 35
ldloc.s 50
call System.Void System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendFormatted(VRage.GameServices.MyGameServiceCallResult value)
nop
ldloca.s 35
call System.String System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::ToStringAndClear()
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
ldsfld Sandbox.MySandboxGame Sandbox.MySandboxGame::Static
callvirt System.Void Sandbox.Engine.Platform.Game::Exit()
nop
ldc.i4.0
stloc.s 9
leave L62
L61:
ldloc.s 47
ldloc.s 49
ldloc.s 48
ldc.i4.1
ldc.i4.1
call static System.Void Sandbox.Game.World.MySession::Load(System.String sessionPath, VRage.Game.MyObjectBuilder_Checkpoint checkpoint, System.UInt64 checkpointSizeInBytes, System.Boolean saveLastStates, System.Boolean allowXml)
nop
call static Sandbox.Game.World.MySession Sandbox.Game.World.MySession::get_Static()
call static System.String VRage.FileSystem.MyFileSystem::get_SavesPath()
ldloc.s 49
ldfld System.String VRage.Game.MyObjectBuilder_Checkpoint::SessionName
ldc.i4.s 0
ldc.i4.s 0
callvirt System.String System.String::Replace(System.Char oldChar, System.Char newChar)
call static System.String System.IO.Path::Combine(System.String path1, System.String path2)
ldnull
callvirt System.Boolean Sandbox.Game.World.MySession::Save(System.String customSaveName, System.Action`1<Sandbox.Game.World.SaveProgress> progress)
pop
call static Sandbox.Game.World.MySession Sandbox.Game.World.MySession::get_Static()
call static Sandbox.Engine.Multiplayer.MyMultiplayerBase Sandbox.Engine.Multiplayer.MyMultiplayer::get_Static()
callvirt System.Void Sandbox.Game.World.MySession::StartServer(Sandbox.Engine.Multiplayer.MyMultiplayerBase multiplayer)
nop
nop
L51:
nop
L47:
nop
leave.s L63
[EX_BeginCatch]
stloc.s 58
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldstr "Exception while loading world: "
ldloc.s 58
callvirt virtual System.String System.Exception::get_Message()
call static System.String System.String::Concat(System.String str0, System.String str1)
callvirt System.Void VRage.Utils.MyLog::WriteLineAndConsole(System.String msg)
nop
call static VRage.Utils.MyLog VRage.Utils.MyLog::get_Default()
ldloc.s 58
callvirt virtual System.String System.Exception::get_StackTrace()
callvirt System.Void VRage.Utils.MyLog::WriteLine(System.String msg)
nop
ldsfld Sandbox.MySandboxGame Sandbox.MySandboxGame::Static
callvirt System.Void Sandbox.Engine.Platform.Game::Exit()
nop
ldc.i4.0
stloc.s 9
[EX_EndException]
leave.s L64
L63:
nop
L21:
ldsfld System.String Sandbox.Engine.Platform.Game::ConnectToServer
call static System.Boolean System.String::IsNullOrEmpty(System.String value)
brtrue.s L65
call static System.Boolean Sandbox.Engine.Networking.MyGameService::get_IsActive()
br.s L66
L65:
ldc.i4.0
L66:
stloc.s 59
ldloc.s 59
brfalse.s L67
nop
ldarg.0
ldftn System.Void Sandbox.MySandboxGame::ServerResponded(System.Object sender, VRage.GameServices.MyGameServerItem serverItem)
newobj System.Void System.EventHandler`1<VRage.GameServices.MyGameServerItem>::.ctor(System.Object object, System.IntPtr method)
call static System.Void Sandbox.Engine.Networking.MyGameService::add_OnPingServerResponded(System.EventHandler`1<VRage.GameServices.MyGameServerItem> value)
nop
ldarg.0
ldftn System.Void Sandbox.MySandboxGame::ServerFailedToRespond(System.Object sender, System.Object e)
newobj System.Void System.EventHandler::.ctor(System.Object object, System.IntPtr method)
call static System.Void Sandbox.Engine.Networking.MyGameService::add_OnPingServerFailedToRespond(System.EventHandler value)
nop
ldsfld System.String Sandbox.Engine.Platform.Game::ConnectToServer
call static System.Void Sandbox.Engine.Networking.MyGameService::PingServer(System.String connectionString)
nop
ldnull
stsfld System.String Sandbox.Engine.Platform.Game::ConnectToServer
nop
L67:
ldc.i4.1
stloc.s 9
br.s L68
L4:
L7:
L9:
L12:
L29:
L31:
L33:
L35:
L37:
L49:
L54:
L58:
L60:
L62:
L64:
L68:
ldloc.s 9
ret
