$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# declared here to make automated updates easier
$name = 'gitob'
$binaryVersion = '1.0.0'
$binaryHost = 'https://storage.googleapis.com/gitob-binary-files-production/pkg'
$checksum_x86 = 'f052ce47273f321bce9980331d87dfd487c47d85ef47c89f9d14da7dfa747793'
$checksum_amd64 = '745f54c907c89498e6d5ccb3305b86407be0d530bb5f099919db2bc956689455'

$packageArgs = @{
  packageName     = $name
  unzipLocation   = $toolsDir
  fileType        = 'exe'
  url             = "$binaryHost/$binaryVersion/gitob_windows_x86.zip"
  url64bit        = "$binaryHost/$binaryVersion/gitob_windows_amd64.zip"

  softwareName    = $name

  checksum        = $checksum_x86
  checksumType    = 'sha256'
  checksum64      = $checksum_amd64
  checksumType64  = 'sha256'

  validExitCodes  = @(0)
  silentArgs      = ''
}

Install-ChocolateyZipPackage @packageArgs
