# Running Torch on .NET 8.0

Here you can find the Space Engineers Torch Server ported to .NET 8.0.

## Usage

### Prerequisites

Clone the [se-dotnet-server](https://github.com/viktor-ferenczi/se-dotnet-server) repository. 
Follow the instructions there to build the game server.

Once the DS works, add Torch by copying over the projects from this repository into
your local Git working copy folder which has the decompiled game server source in it. 
Overwrite the solution file or add the projects manually in your IDE.

### Instance

Set the `TORCH_ROOT` environment variable to the full path of the folder you have
the `Instance` folder in (it usually has `Logs`, `Plugins`, `Torch.cfg`, etc.).

### Cleanup

Make sure to remove these files from your `TORCH_ROOT` folder:
- The binary files of the original Torch installation
- `_CommonRedist`
- `appcache`
- `config`
- `Content`
- `DedicatedServer64`
- `Logs` (recommended for clarity)
- `steamapps`
- `steamcmd`

**Keep** the following:
- `Torch.cfg`
- `Instance`
- `Plugins`

_If you run multiple Torch instances as the same Windows user, then you need to
create "startup" batch files for each of the instances and set `TORCH_ROOT` in
those accordingly._

### Run Torch on .NET 8.0

Build and run it from the command line by executing the
`BuildAndRunTorch.bat` script.

For debugging run the `Torch.Server` project from your IDE.

## Compatibility

- Harmony 2.3.3 is used for binary patching with a compatibility layer in place to support Torch patches. `*`
- Plugins using transpiler patches may not work. Such patches need to be fixed to handle both the old and new .NET. 

### How to detect whether a plugin runs on .NET Framework 4.8 or .NET 8.0?

This was tested to work reliably:
```cs
var isOldDotNetFramework = Environment.Version.Major < 5;
```

## Credits

`*` The `PatchManager` code was copied from [PvPTeam Torch](https://github.com/PveTeam/Torch) in order to avoid duplicating that work. The changes were made by `zznty`. That repo contains another solution to run Torch on recent .NET.

## References

- [Space Engineers Dedicated Server on .NET 8.0](https://github.com/viktor-ferenczi/se-dotnet-server)
- Original [Torch](https://github.com/TorchAPI/Torch)
- [PvPTeam Torch](https://github.com/PveTeam/Torch)
