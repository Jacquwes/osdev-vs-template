# OS Dev on Visual Studio made easy

This is a template project for OS development on Visual Studio.
It is based on [obos](https://github.com/oberrow/obos) and 
[limine](https://github.com/limine-bootloader/limine).

I wish I found something like this earlier, so I hope it helps someone else.

## Prerequisites

- Visual Studio with Linux development workload
- [CMake](https://cmake.org/download/)
- WSL
	- A GCC cross-compiler for x86-64-elf (see [osdev.org](https://wiki.osdev.org/GCC_Cross-Compiler))
	- [qemu](https://www.qemu.org/download/#linux)								
	- [openssh-server](https://ubuntu.com/server/docs/service-openssh)

## Getting started

1. Clone this repository with submodules.
```bash
git clone --recurse-submodules https://github.com/jacquwest/osdev-vs-template.git
```

2. Build limine executable in wsl.
```bash
cd osdev-vs-template/limine
make
```

3. Edit `.vs/launch.vs.json` to match your configuration. Many macros don't work.
	- `configurations[0].customLaunchSetupCommands[0].text`
	- `configurations[0].remotePrelaunchCommand`
iso on linux should be in 
`~/.vs/osdev-vs-template/project-hash/out/build/Linux-GCC-Debug/osdev-vs-template`

4. Edit `CMakeSettings.json` to match your configuration.
	- `configurations[0].variables[0].value

5. Switch target to `debug-qemu` in Visual Studio and run.
Make sure you have a ssh server running on your wsl instance.