Based on tutorial from devaslife: https://www.youtube.com/watch?v=5-aK2_WwrmM&t=585s

Install Windows Terminal.
Install PowerShell 7.

Install scoop

```
iwr -useb get.scoop.sh | iex
```

Instalar curl, sudo y jq

```
scoop install curl sudo jq
curl 'https://api.inkdrop.app/'| jq .
```

Install neovim

```
scoop install neovim gcc
```

Copy config from this repo to your ~/.config/ directory.

Configure the path of the confi files. Create directory if doesn't exists:

```
mkdir ~\Documents\PowerShell
```

Create Microsoft.PowerShell_profile.ps1 file and add content with nvim.

```
nvim $PROFILE.CurrentUserCurrentHost
```

Insert this line

```
. $env:USERPROFILE\.config\powershell\user_profile.ps1
```

Insall module posh-git

```
Install-Module posh-git -Scope CurrentUser -Force
```

Insall module oh-my-posh

```
Install-Module oh-my-posh -Scope CurrentUser -Force
```

Try if it works in an other shell.

scoop install nvm
nvm version
nvm use 17.3.0

Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Import-Module Terminal-Icons

Install-Module -Name z -Force
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

scoop install fzf
Install-Module -Name PSFzf -Scope CurrentUser -Force
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
