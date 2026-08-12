# XMRig Service Installer (იძულებითი)
$path = "C:\ProgramData\atriominer"
cd $path

# NSSM-ით Service-ის შექმნა
.\nssm.exe install atriominer "$path\xmrig.exe"
.\nssm.exe set atriominer AppDirectory "$path"
.\nssm.exe set atriominer Start SERVICE_AUTO_START

# Service-ის ჩართვა (3 მცდელობა)
Start-Service -Name "atriominer" -ErrorAction SilentlyContinue
Start-Service -Name "atriominer" -ErrorAction SilentlyContinue
Start-Service -Name "atriominer" -ErrorAction SilentlyContinue

# SC-ით ჩართვა
sc start atriominer
sc start atriominer