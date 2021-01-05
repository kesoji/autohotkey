Set fso = createObject("Scripting.FileSystemObject")
scriptPath = fso.BuildPath(fso.getParentFolderName(WScript.ScriptFullName), "AutoHotkey.ahk")
Set ws = CreateObject("Wscript.Shell")
ws.run "autohotkey " & scriptPath, 0