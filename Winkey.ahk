;#a:: ;クイック設定を開く。
;#b:: ;タスク バーの隅にある最初のアイコンにフォーカスを設定します。
#c:: ;Microsoft Teams から [チャット] を開きます。
{
    Run "https://www.google.com/calendar/render"
}
;#d:: ;Show Desktop
;#e:: ;Show Explorer
#f:: ;Open Feedback Hub and take a screenshot
{
    Save := A_Clipboard
    Send "^c"
    Sleep 100
    Run "https://www.google.co.jp/search?q=" . A_Clipboard . "&oq=&gs_l=&pbx=1&hl=ja"
    A_Clipboard := Save
}
;#g:: ;Open Game bar when a game is open
#h:: ;Start dictation
{
    Run EnvGet("USERPROFILE")
}
;#i:: ;Open Settings
#j:: ;Set focus to a Windows tip when one is available.
{
    Run A_Desktop
}
#k:: ;Open the Connect quick action
{
    Run EnvGet("USERPROFILE") . "\Downloads"
}
;#l:: ;Lock
;#m:: ;Minimize window
;#n:: ;Notification Center
#o:: ;Lock device orientation
{
    WinSetAlwaysOnTop -1, "A" ; A=active window
}
;#p:: ;Display Setting
;#q::
;#r:: ;Show Run-command
;#s:: ;Cortana
;#t:: ;タスク バー上のアプリを順番に切り替える。
;{
;    WinGet tp Transparent "A"
;    if tp =
;        WinsetTransparent 230, "A"
;    else
;        WinsetTransparent OFF, "A"
;}
;#u:: ;Open Ease of Access Center
;#v:: ;Cycle through notifications
;#w:: ;Show widgets
;#x:: ;Open the Quick Link menu
;#y:: ;Switch input between Windows Mixed Reality and your desktop
#z:: ;スナップ レイアウトを開きます。
{
    if WinExist("ahk_exe Notion.exe")
        WinActivate
    else
        Run "C:\Users\shint\AppData\Local\Programs\Notion\Notion.exe"
}
;#,:: ;Temporarily peek at the desktop.
;#.:: ;Open emoji panel.

#LButton:: Send "#^{Left}"
#RButton:: Send "#^{Right}"
#MButton:: Send "{Volume_Mute}"
#WheelUp:: Send "{Volume_Up}"
#WheelDown:: Send "{Volume_Down}"
#[:: Send "{Volume_Up}"
#]:: Send "{Volume_Down}"
#@:: Send "{Volume_Mute}"
