function Add-Path($Path) {
    $Path = [Environment]::GetEnvironmentVariable("PATH", "Machine") + [IO.Path]::PathSeparator + $Path
    [Environment]::SetEnvironmentVariable( "Path", $Path, "Machine" )
}

# Fast directory switch
function cdf() {
  Invoke-Expression -Command "cd $(fd -t d | fzf)"
}

Set-Alias -Name sudo -Value "C:\Program Files (x86)\gsudo\gsudo.exe"
Set-Alias -Name pbcopy -Value "clip"

oh-my-posh init pwsh --config "~/src/dotfiles-windows/powershell/.customized-theme.omp.json" | Invoke-Expression

Import-Module -Name Terminal-Icons
