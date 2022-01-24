#Prompt
Import-Module posh-git
Import-Module oh-my-posh

function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) "am4rtinez.omp.json"
#$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) "am4rtinez.bluw-owl.omp.json"
#$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) "am4rtinez.deimos.json"
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

#Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\use\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\use\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
  Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
