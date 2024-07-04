# mwt-minimalism
My way to minimalism -> Configs and stuff to setup a mostly terminal based development environment.

These are tools and configs to setup an environment getting more focused while working.

It's organized in sections rather than visualizing the process to set up.  
First install all software you're need and change configurations later.

**Info:** The default *%home%-path* in windows is `$env:USERPROFILE`.


## Setup

### Font (for nearly every tool)
Download and install for `all users` (context-menu -> Show more options). 

[Nerd Fonts](https://www.nerdfonts.com/font-downloads):
- CaskaydiaCove Nerd Font


### PowerShell
Install over Win-store (v 7+/ core) and set it as default in `Terminal`.

Settings, color-scheme and config (`Microsoft.PowerShell_profile.ps1`) are in subfolder `Powershell`.  
It loads starship and adds some aliases/ functions. (It's still grow over time.)

[It needs to be pasted in `%home%\Documents\PowerShell`. You can find out the full path with env-var `$PROFILE`.]

All settigs are saved in `%AppData%\..\Local\Packages\Microsoft.WindowsTerminal_XXX\LocalState` in `settings.json` (override it). The last installed PowerShell and other shells, like Linux, are needed to set by yourself. In addition, you need to set a `Default profile`!

**Note:** `%home%`was set in *`'Edit environment variables for your account'`* with the path to user-home. The start-path is set to `%home%\Documents\git`. So you need to add the subfolder `git`in `Documents`.


#### -> Terminal-Icons
If you want to use `Terminal-Icons`, you can install and load the `dark_trees.psd1` color-theme.

Add color-theme and check, if it has been added:
```
> Add-TerminalIconsColorTheme %home%\Documents\PowerShell\dark_trees.psd1
> Get-TerminalIconsColorTheme
```

Set color-theme and show all icons with color:
```
> Set-TerminalIconsTheme -ColorTheme dark_trees
> Show-TerminalIconsTheme
```

**Note:** You should copy these file first into the PowerShell profie folder.


### WSL2
WSL2 is used for docker and vms. So run while logged into an admin-account:

```
> Start-Process powershell -Verb runAs
> wsl --install
```

If you use older versions, set WSL to version 2. In newer days, it's set as default to version 2.

```
> wsl --set-default-version 2
```


### Starship
The config `starship.toml` in subfolder `Starship` is currently a begin and needs some improvements over time.  

It needs to be pasted in `%home%\.config\`.

You need to set `'CaskaydiaCove Nerd Font'` as default font to your editor to edit this config.

Install starship with ginget:
```
> winget install --id Starship.Starship
```

### Helix
The config `config.toml` in subfolder `Helix` is currently a begin and needs some improvements over time.  

It needs to be pasted in `%AppData%\helix\`.

Adds helix as default editor for git:

```
> git config --global core.editor "hx"
```


### Notepad++
Installed plugins are:
- ComparePlugin
- DSpellCheck


## Software (win)
Tools for development i'm currently using on windows.

### winget
Can be used to install, uninstall and update software.

### git
I installed git with scoop. (See section below.)

Configure user and mail:
```
> git config --global user.name "YOUR NAME"
> git config --global user.email "YOUR@MAIL.ADDRESS"
```

Check your settings:
```
> git config --list
```

You can create a ssh-key with:
```
> ssh-keygen -t ed25519 -C "YOUR@MAIL.ADDRESS"
```

If you want, change the startup-type for ssh-agent (I've used 'Manual'):
```
> Get-Service -Name ssh-agent | Set-Service -StartupType [ Manual | Automatic ]
```

Start the ssh-agent to add your key:
```
> Start-Service ssh-agent
```

Add your key:
```
> ssh-add %home%/.ssh/id_ed25519
```

Get the status of ssh-agent:
```
> Get-Service ssh-agent
```


### Docker
You can install docker for windows with winget, the win-store or as downloadable setup.

Install docker with winget:
```
> winget install --id Docker.DockerDesktop
```

If you're not using docker as admin (recommended not to use an admin-account in general), you need to add your account to the docker group (… pipeline fail).    
(`USER-NAME` is the name of youre home-folder.)
```
> net localgroup docker-users "USER-NAME" /ADD
```

You can check users of the docker group with:
```
> Get-LocalGroupMember -Group "docker-users"
```


### scoop
Install [Scoop](https://scoop.sh/) for user-software.

```
> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
> irm get.scoop.sh | iex
```

My currently installed apps:
```shell
Name            Source
----            ------
7zip            main   
cmake           main   
corretto-jdk    java   
dark            main   
gcc             main   
ghcup           main   
git             main   
go              main   
golangci-lint   main   
helix           main   
innounp         main   
jdtls           main   
lazygit         extras 
llvm            main   
make            main   
marksman        main   
msys2           main   
posh-git        extras 
python          main   
ruby            main   
rustup          main   
sqlite          main   
terminal-icons  extras 
tldr            main   
```

#### -> add a bucket -> i.e. 'main' (if not existing)
```
> scoop bucket add main
```


#### -> add a package -> i.e. 'git' in 'main'
```
> scoop install main/git
```


## Configure LSPs
Some stuff to activate LSPs for Helix.
To test these LSPs, example files are in folder `LSP-Tests`.

Some LSPs need more configuration for helix. So you need to add `languages.toml`
to `%AppData%\helix\`.

For more information read [helix-WiKi](https://github.com/helix-editor/helix/wiki/Language-Server-Configurations)

### python
Update pip:
```
> python -m pip install --upgrade pip
```

Install python-lsp-server:
```
> pip install pyright
> pip install ruff-lsp
> pip install black
```

### CMake
Install LSP:
```
> pip install cmake-language-server
```

### rust
Add rust-analyzer to rustup, to get the lsp running:
```
> rustup component add rust-analyzer
```

Activate gnu-toolchain:
```
> rustup set default-host x86_64-pc-windows-msvc
```

### Markdown
Install LSPs:
```
> cargo install --git https://github.com/Feel-ix-343/markdown-oxide.git markdown-oxide
```

### Go
Install LSPs:
```
> go install golang.org/x/tools/gopls@latest
> go install github.com/go-delve/delve/cmd/dlv@latest
> go install golang.org/x/tools/cmd/goimports@latest
```

And after installing `golangci-lint` with scoop:
```
> go install github.com/nametake/golangci-lint-langserver@latest
```

### Java
Ready after installing the `jdtls` package with sccop.

### ruby
Install LSP (you have to run `ridk install` first):
```
> gem install solargraph
> gem install rubocop
```


## Software (vm: deb)
Use Win-Store and add as profile to Terminal. (Installation over powershell is supported, too.)  
I'm currently using debian.


## MISC

### haskell
If you want to get loaded modules and the `λ` sign to `hgci`, you can set this in the config (`%AppData%/ghc/ghci.conf`):
```
:set prompt "\n%s\n\x03BB> "
```
