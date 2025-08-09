@echo off\r\npowershell -ExecutionPolicy Bypass -File "%~dp0scripts\Create-Project.ps1" -ProjectName %1 -Domain %2
