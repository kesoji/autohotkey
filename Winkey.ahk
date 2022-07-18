;#a:: ;クイック設定を開く。
;#b:: ;タスク バーの隅にある最初のアイコンにフォーカスを設定します。
#c:: ;Microsoft Teams から [チャット] を開きます。
    Run https://www.google.com/calendar/render
    Return
;#d:: ;Show Desktop
;#e:: ;Show Explorer
#f:: ;Open Feedback Hub and take a screenshot
    Save := Clipboard
    Send ^c
    Sleep 100
    if (WinExist("ahk_exe chrome.exe")) {
        WinActivate
        Send,^t
        Sleep 100
        Send,^v
        Sleep 25
        Send,{Enter}
    } else {
        Run "https://www.google.co.jp/search?q=%Clipboard%&oq=&gs_l=&pbx=1&hl=ja"
    }
    Clipboard := Save
    Return
;#g:: ;Open Game bar when a game is open
#h:: ;Start dictation
    Run "%USERPROFILE%"
    Return
;#i:: ;Open Settings
#j:: ;Set focus to a Windows tip when one is available.
    Run "%USERPROFILE%\Desktop"
    Return
#k:: ;Open the Connect quick action
    Run "%USERPROFILE%\Downloads"
    Return
;#l:: ;Lock
;#m:: ;Minimize window
;#n:: ;Notification Center
#o:: ;Lock device orientation
    WinSet, AlwaysOnTop, toggle, A  ; A=active window
    Return
;#p:: ;Display Setting
;#q::
;#r:: ;Show Run-command
;#s:: ;Cortana
;#t:: ;タスク バー上のアプリを順番に切り替える。
;    WinGet, tp, Transparent, A
;    If tp =
;        Winset, Transparent, 230, A
;    Else
;        Winset, Transparent, OFF, A
;    Return
;#u:: ;Open Ease of Access Center
;#v:: ;Cycle through notifications
;#w:: ;Show widgets
;    Send ^c
;    Run "C:\Windows\notepad.exe"
;    Sleep 100
;    Send ^v
;    Return
;#x:: ;Open the Quick Link menu
;#y:: ;Switch input between Windows Mixed Reality and your desktop
#z:: ;スナップ レイアウトを開きます。
    IfWinExist ahk_exe Notion.exe
        WinActivate
    Else
        Run "C:\Users\shint\AppData\Local\Programs\Notion\Notion.exe"
    Return
;#,:: ;Temporarily peek at the desktop.
;#.:: ;Open emoji panel.

#LButton:: Send, #^{Left}
#RButton:: Send, #^{Right}
#MButton:: Send, {Volume_Mute}
#WheelUp:: Send, {Volume_Up}
#WheelDown:: Send, {Volume_Down}
#[:: Send, {Volume_Up}
#]:: Send, {Volume_Down}
#@:: Send, {Volume_Mute}
