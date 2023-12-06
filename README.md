# mwt-minimalism
My way to minimalism -> Configs and stuff to setup a mostly terminal based development environment.

These are tools and configs to setup an environment getting more focused while working.

It's organized in sections rather than visualizing the process to set up.  
First install all software you're need and change configurations later.


## Setup

### PowerShell
Install over Win-store (v 7+/ core) and set it as default in `Terminal`.

Settings, color-scheme and config (`Microsoft.PowerShell_profile.ps1`) are in subfolder `Powershell`.  
It loads starship and adds some aliases/ functions. (It's still grow over time.)

[It needs to be pasted in `%home%/Documents/PowerShell`. You can find out the full path with env-var `$PROFILE`.]

### Font (for nearly every tool)
Download and install for `all users` (context-menu -> Show more options). 

[Nerd Fonts](https://www.nerdfonts.com/font-downloads):
- CaskaydiaCove Nerd Font

### WSL2
WSL2 is used for docker and vms.

```
> Start-Process powershell -Verb runAs
> wsl --install

> wsl --set-default-version 2
```

### git-Bash
I'm using the profile (`.bash_profile`) in subfolder `git-Bash` since many years.  
For the reason, git bash has some problems handling the `.ssh agent`.  
This scrip is not needed probably.

It loads starship and handles the ssh-agent.  
[It needs to be pasted in `%home%`.]

### Starship
The config `starship.toml` in subfolder `Starship` is currently a begin and needs some improvements over time.  
[It needs to be pasted in `%home%/.config`.]

### Helix
The config `config.toml` in subfolder `Helix` is currently a begin and needs some improvements over time.  
[It needs to be pasted in `%home%/scoop/persist/helix`.]

### VS-Code
The config `default.code-profile` in subfolder `VS-Code` is the default I'm using.  
The other configs are for other languages or workflows.

### Notepad++
The gui-config `config.txt` in subfolder `Notepad++` needs to be pasted in the config of Notepad++.  
[Configs and plugins are stored in `%AppData%\Notepad++\`.]

Installed plugins are:
- ComparePlugin
- DSpellCheck
- mimeTools
- NppConverter
- NppExport


## Software (win)
Tools for development i'm currently using on windows.

### winget
Can be used to install, uninstall and update software.

#### -> git
If git is unable to install over winget -> download it and run the setup manually.
```
> Start-Process powershell -Verb runAs
> winget install --id Git.Git -e --source winget
```

Configure user and mail:
```
> git config --global user.name "XYZ"
> git config --global user.email "XXX@yyy.zzz"

> git config --list
```

#### -> others
```
> winget install --id Starship.Starship
> winget install --id Docker.DockerDesktop
> winget install --id Brave.Brave

> winget install --id Notepad++.Notepad++
> winget install --id Microsoft.VisualStudioCode
```

### scoop
Install [Scoop](https://scoop.sh/) for user-software.

```
> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
> irm get.scoop.sh | iex
```

#### -> bucket - main
For the first time:
```
> scoop bucket add main
```

Packages:
```
> scoop install main/helix
> scoop install main/tldr
> scoop install main/make
```

Languages:
```
> scoop install main/python
> scoop install main/go
> scoop install main/rust
```

#### -> bucket - extras
For the first time:
```
> scoop bucket add extras
```

Packages:
```
> scoop install extras/lazygit
```


## Software (vm: deb)
Tools for development i'm currently using on linux (vm on win - debian).

to be continued ...