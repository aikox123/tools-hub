@echo off
cd /d "%~dp0"
start /B xmrig.exe --config=config.json
exit