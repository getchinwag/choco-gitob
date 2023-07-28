# This runs to ensure that all git hooks, etc. are unset.

$ErrorActionPreference = 'Stop'; # stop on all errors

try
{
    $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
    $exePath = Join-Path $toolsDir "gitob.exe"
    Start-Process -FilePath $exePath -ArgumentList "uninstall" -Verb "RunAs" -Wait  -NoNewWindow
}
catch
{
    Write-Warning $_.Exception.Message
}

