# Libdragon template

A libdragon vscode template to quickly have a build environment in a devcontainer.

## Feature compatibility

| Host OS | USB upload | Debug in ares | Audio | USB debugging | Building N64 ROMs | vscode file navigation |
| --- | ----------- | --- | --- | --- | --- | --- |
| Linux | ✅ | ✅ | ✅ Pulse Audio | 🚧 TODO | ✅ | ✅ |
| Windows | ❔ not yet tested + [additional setup](https://learn.microsoft.com/en-us/windows/wsl/connect-usb) required | ❌ | ❌ | ❌ | ✅ | ✅ |
| MacOS (x86) | ❌ | ❔ not yet tested | ❌ | ❌ | ✅ | ✅ |
| MacOS (ARM) TODO | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ |

## Prerequisites

Only [docker](https://www.docker.com/products/docker-desktop/) or a compatible environment is required.

If you want to upload code via USB, you should have [udev rules installed](https://github.com/buu342/N64-UNFLoader/blob/master/UNFLoader/README.md#system-requirements) on Linux.

## Usage

Clone & open the repository in [vscode](https://code.visualstudio.com/) and run `Dev Containers: Reopen in Container` from the command pallette (CTRL/CMD + SHIFT/OPTION + P).

Make sure you have libdragon repository (or you can also clone this repository with `--recurse-submodules`):

```bash
git submodule update --init
```

Then to build the sample hello world code, run:

```shell
make
```

There are also two vscode launch configurations:

- **Debug on ares:** Will build & start debugging hello world code in ares.
- **Debug on N64:** Will build & upload hello world code via UNFLoader. Debugging is not fully working. You can instead use `Attach to N64` after running `UNFLoader -b -g 0.0.0.0:8080 -r hello.z64` and booting your ROM.

## TODO

- [ ] Also include tiny3d for ease of use here.