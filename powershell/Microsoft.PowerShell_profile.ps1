function Add-Path($Path) {
    $Path = [Environment]::GetEnvironmentVariable("PATH", "Machine") + [IO.Path]::PathSeparator + $Path
    [Environment]::SetEnvironmentVariable( "Path", $Path, "Machine" )
}

function Workspace-Space-Details($Monitor, $Space) {
  komorebic state | jq ".monitors.elements[$Monitor].workspaces.elements[$Space]"
}

# Fast directory switch
function cdf() {
  Invoke-Expression -Command "cd $(fd -t d | fzf)"
}

Set-Alias -Name sudo -Value "C:\Program Files (x86)\gsudo\gsudo.exe"
Set-Alias -Name pbcopy -Value "clip"
Set-Alias -Name python3 -Value "python"

oh-my-posh init pwsh --config "~/src/dotfiles-windows/powershell/.customized-theme.omp.json" | Invoke-Expression

Import-Module -Name Terminal-Icons
