using System.IO;
using System.ServiceProcess;
using Microsoft.VisualBasic.Devices;
using NLog;
using NLog.Targets;
using Torch.Managers;
using VRage;
using VRage.Network;

namespace Torch.Server
{
    internal static class Program
    {
        public static string WorkingDir;
        public static string BinDir;
        
        /// <remarks>
        /// This method must *NOT* load any types/assemblies from the vanilla game, otherwise automatic updates will fail.
        /// </remarks>
        [STAThread]
        public static void Main(string[] args)
        {
            BinDir = new FileInfo(typeof(Program).Assembly.Location).Directory.ToString();
            Directory.SetCurrentDirectory(BinDir);
            
            // Logs, Content and Instance must be in the working directory (TORCH_ROOT, falls back to the binary folder)
            WorkingDir = Environment.GetEnvironmentVariable("TORCH_ROOT") ?? BinDir;
            PluginManager.PluginDir = Path.Combine(WorkingDir, "Plugins");
            
            Target.Register<FlowDocumentTarget>("FlowDocument");
            MyVRage.RegisterExitCallback(LogManager.Shutdown);
            
            // Load ReplicatedTypes.json from the binary folder
            ReplicatedTypes.Load();
            
            try 
            {
                // if (!TorchLauncher.IsTorchWrapped())
                // {
                //     TorchLauncher.Launch(Assembly.GetEntryAssembly().FullName, args, BinDir);
                //     return;
                // }

                // Breaks on Windows Server 2019
                if ((!new ComputerInfo().OSFullName.Contains("Server 2019") && !new ComputerInfo().OSFullName.Contains("Server 2022")) && !Environment.UserInteractive)
                {
                    using (var service = new TorchService(args))
                        ServiceBase.Run(service);
                    return;
                }

                var initializer = new Initializer(WorkingDir);
                if (!initializer.Initialize(args))
                    return;

                initializer.Run();
            } 
            catch (Exception runException)
            {
                var log = LogManager.GetCurrentClassLogger();
                log.Fatal(runException.ToString());
            }
        }
    }
}
