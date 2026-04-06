# Libdragon template

A libdragon vscode template to quickly have a build environment in a devcontainer.

## Feature compatibility

| Host OS | USB upload | Debug in ares | Audio | USB debugging | Building N64 ROMs | vscode file navigation | pyrite64
| --- | ----------- | --- | --- | --- | --- | --- | --- |
| Linux | ✅ | ✅ | ✅ Pulse Audio | 🚧 TODO | ✅ | ✅ | 🚧 TODO |
| Windows | ❔ + [additional setup](https://learn.microsoft.com/en-us/windows/wsl/connect-usb) required | ❌ | ❌ | ❌ | ✅ | ✅ | ❌ |
| MacOS (x86) | ❌ | ❌ | ❌ | ❌ | ✅ | ✅ | 🚧 TODO |
| MacOS (ARM) TODO | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | 🚧 TODO |

## Prerequisites

Only [docker](https://www.docker.com/products/docker-desktop/) or a compatible environment is required.

If you want to upload code via USB, you should have [udev rules installed](https://github.com/buu342/N64-UNFLoader/blob/master/UNFLoader/README.md#system-requirements) on Linux.

## Usage

Clone & open the repository in [vscode](https://code.visualstudio.com/) and run `Dev Containers: Reopen in Container` from the command pallette (CTRL/CMD + SHIFT/OPTION + P). Then select your OS from available container settings.

This will install all dependencies in the container and also execute the following commands for you. First run might take a while as it will download quite some stuff.

Make sure you have libdragon repository (or you can also clone this repository with `--recurse-submodules`):

```bash
git submodule update --init
```

Build & install libdragon & tiny3d:

```bash
make -C libdragon install tools-install -j $(getconf _NPROCESSORS_ONLN)
make -C tiny3d install tools/gltf_importer tools/gltf_importer install -j $(getconf _NPROCESSORS_ONLN)
```

Then to build the sample hello world code, run:

```shell
make
```

There are also two vscode launch configurations:

- **Debug on ares:** Will build & start debugging hello world code in ares.
- **Debug on N64:** Will build & upload hello world code via UNFLoader. Debugging is not fully working. You can instead use `Attach to N64` after running `UNFLoader -b -g 0.0.0.0:8080 -r hello.z64` and booting your ROM.

### Access to your host files

By default devcontainer have your host homes attached at `/var/home`. You can use this location to copy/link any important configurations you have for your user into the container's `/home/ubuntu`. You can use [`dotfiles`](https://code.visualstudio.com/docs/devcontainers/containers#_personalizing-with-dotfile-repositories) to do so.

Out of the box, devcontainer will also create a volume for the container user (i.e `home/ubuntu`) so that it can persist bash history and such across container recreations.