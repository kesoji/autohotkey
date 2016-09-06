; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

#UseHook
#InstallKeybdHook
#MaxHotkeysPerInterval 10000

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

; Program Path
App_explorer = "C:\Windows\explorer.exe"
App_browser := "C:\Program Files\Google\Chrome\Application\chrome.exe"
App_editor := "C:\Windows\notepad.exe"
App_pdfviewer := "C:\Program Files\Adobe\Reader 11.0\Reader\AcroRd32.exe"

; For Office. !!PROGRAM PATHS OVERRIDE!!
#Include OfficeOnly.ahk

sc07B & /::
    If GetKeyState("Shift", "P")
        send,I
    Else
        Send,H
return
;RButton::Send,{RButton}
;RButton & WheelDown::Send,^{Tab}
;RButton & WheelUp::Send,^+{Tab}

; Window Transparency
#Y::
  WinGet, tp, Transparent, A
  If tp =
    Winset, Transparent, 160, A
  else
    Winset, Transparent, OFF, A
return

sc07B & 0::Reload
sc07B & 3::
    Save := Clipboard
    Send ^c
    Sleep 300
    Run %App_browser% "%Clipboard%"
    Sleep 300
    Clipboard := Save
    Return
sc07B & 4::
    Save := Clipboard
    Send ^c
    Sleep 300
    StringReplace, Clipboard, Clipboard, /, \, All
    Run %App_editor% "%Clipboard%"
    Sleep 300
    Clipboard := Save
    Return
sc07B & 5::
    Save := Clipboard
    Send ^c
    Sleep 300
    StringReplace, Clipboard, Clipboard, /, \, All
    Run %App_explorer% "%Clipboard%"
    Sleep 300
    Clipboard := Save
    Return
sc07B & 8::
    Save := Clipboard
    Send ^c
    Sleep 300
    StringReplace, Clipboard, Clipboard, /, \, All
    Run %App_editor% "%A_ScriptFullPath%"
    Sleep 300
    Clipboard := Save
    Return
sc07B & LButton::
    If GetKeyState("Shift", "P") {
        Send ^c
        Sleep 100
        Run https://www.google.com/search?q=%Clipboard%
    }Else{
        Send,{Blind}{BS}
    }
return
sc07B & RButton::
    If GetKeyState("Shift", "P"){
        Send ^c
        Sleep 100
        Run http://ejje.weblio.jp/content/%Clipboard%
    }Else{
        Send,{Blind}{Del}
    }
return
sc07B & MButton::Send,{Blind}{Home}+{End}
sc07B & f::Send,{Blind}{Return}
sc07B & r::send,{Blind}{F2}
sc07B & c::Send,{AppsKey}


; LButton::
; If GetKeyState("RButton", "P")
;     send, {Blind}{Return}
; Else
;     Click
; Return
^Q::Send, !{F4}

#c::Run https://www.google.com/calendar/render
#t::Run http://thecolourclock.co.uk/
#i::Run "C:\Program Files\Internet Explorer\iexplore.exe"
#g::
    Save := Clipboard
    Send ^c
    Sleep 500
    Run "https://www.google.co.jp/search?q=%Clipboard%&oq=&gs_l=&pbx=1&hl=ja"
    Clipboard := Save
    Return
#a::
    Save := Clipboard
    Send ^c
    Sleep 500
    Run %App_pdfviewer% "%Clipboard%"
    Clipboard := Save
    Return
#s::
    Send {F2}
    Sleep 50
    Send ^c
    Send !+e
    Sleep 500
    Send ^v
    Return

sc07B::sc07B
sc079::sc079
; HJKL
sc07B & h::Send,{Blind}{Left}
sc079 & h::Send,{Blind}{Left}
sc07B & j::Send,{Blind}{Down}
sc079 & j::Send,{Blind}{Down}
sc07B & k::Send,{Blind}{Up}
sc079 & k::Send,{Blind}{Up}
sc07B & l::Send,{Blind}{Right}
sc079 & l::Send,{Blind}{Right}
; WASD
sc07B & a::Send,{Blind}{Left}
sc079 & a::Send,{Blind}{Left}
sc07B & s::Send,{Blind}{Down}
sc079 & s::Send,{Blind}{Down}
sc07B & w::Send,{Blind}{Up}
sc079 & w::Send,{Blind}{Up}
sc07B & d::Send,{Blind}{Right}
sc079 & d::Send,{Blind}{Right}
; Other moves
sc07B & q::Send,{Blind}{PgUp}
sc079 & q::Send,{Blind}{PgUp}
sc07B & e::Send,{Blind}{PgDn}
sc079 & e::Send,{Blind}{PgDn}
sc07B & z::Send,{Blind}{Home}
sc079 & z::Send,{Blind}{Home}
sc07B & x::Send,{Blind}{End}
sc079 & x::Send,{Blind}{End}
; Select
sc07B & t::Send,{Blind}{Home}+{End}
; Terminal
sc07B & `;::Send,{Blind}{Esc}b
sc079 & `;::Send,{Blind}{Esc}b
sc07B & sc028::Send,{Blind}{Esc}f
sc079 & sc028::Send,{Blind}{Esc}f
; Others
sc07B & Tab::send,{Tab}{Tab}{Tab}{Tab}{Tab}
sc07B & space::send,{Blind}{Enter}
sc079 & space::send,{Blind}{Enter}
sc07B & n::Send,{Blind}{Esc}
sc079 & n::Send,{Blind}{Esc}
sc07B & i::Send,{Blind}{BS}
sc079 & i::Send,{Blind}{BS}
sc07B & o::Send,{Blind}{Del}
sc079 & o::Send,{Blind}{Del}
sc07B & @::send,^b
sc079 & @::send,^b
sc07B & p::send,^b
sc079 & p::send,^b
sc07B & 1::send,^+{Tab}
sc07B & 2::send,^{Tab}
sc07B & WheelUp::
    If GetKeyState("Alt", "P")
        send,^+{PgUp}
    Else
        send,^{PgUp}
    return
sc07B & WheelDown::
    If GetKeyState("Alt", "P")
        send,^+{PgDn}
    Else
        send,^{PgDn}
    return
; Chars
sc07B & Up::send,ª
sc079 & Up::send,ª
sc07B & Down::send,«
sc079 & Down::send,«
sc07B & Right::send,¨
sc079 & Right::send,¨
sc07B & Left::send,©
sc079 & Left::send,©
sc07B & [::
    If GetKeyState("Shift","P")
        send,w
    else
        send,y
    return
sc079 & [::
    If GetKeyState("Shift","P")
        send,w
    else
        send,y
    return
sc07B & ]::
    If GetKeyState("Shift","P")
        send,x
    else
        send,z
    return
sc079 & ]::
    If GetKeyState("Shift","P")
        send,x
    else
        send,z
    return

; Utilities
:*:fme::from:me
:*:tme::to:me
:*:`=IDR::=INDIRECT()
:*:`=IDX::=INDEX()
:*:`=NW::=NOW()
:*:`#dbg::Debug.Print 
:*:'eL::export LANG=ja_JP.UTF-8
:*:'eP::export PS1="\[\e[1;34m\][\u@\h \W]$ \[\e[00m\]"
:*:'gip::/sbin/ip a|grep inet
:*:'ip::/sbin/ip a|grep inet
:*:grepl::grep --line-buffered 
:*:egrepl::egrep --line-buffered 
:*:fgrepl::fgrep --line-buffered 
:*:'log::Logger.log();{Left}{Left}
:*:vbar::|
:*:2dv::2>/dev/null
:*: ]d::
    FormatTimeAndPaste("yyyy/MM/dd")
    return
:*: ]cd::
    FormatTimeAndPaste("yyyy/M/d")
    return
:*: ]e::
    FormatTimeAndPaste("yyyyMMdd")
    return
:*: ]t::
    FormatTimeAndPaste("HH:mm")
    return
:*: ]s::
    FormatTimeAndPaste("HH:mm:ss")
    return
:*: ]fd::
    FormatTimeAndPaste("_yyyyMMdd")
    return
:*: ]yd::
    FormatTimeAndPaste("yyyy/MM/dd (ddd)")
    return
:*:'igai::{^}(?{!}.*).*${Left 4}


sc07B & M::
    FromExcelPasteDoubleQuoteReplace()
    Send ^v
    Sleep 50
    Send, {BS}
    return

; Functions
FormatTimeAndPaste(format) {
    Save := Clipboard
    FormatTime, Clipboard, , %format%
    Send ^v
    Sleep 500
    Clipboard := Save
}

FromExcelPasteDoubleQuoteReplace() {
    Clipboard := RegExReplace(Clipboard, "^""", "")
    Clipboard := RegExReplace(Clipboard, """$", "")
}

RemoveCrLfFromClipboard() {
    StringReplace, Clipboard, Clipboard, `r`n, , All
}

ChangeCrLfToReturnFromClipboard() {
    StringReplace, Clipboard, Clipboard, `r`n, \n, All
}

;;Perl
:*:usuw::use strict;{Enter}use warnings;

;;Javascript
:*:jsdq::/**{Enter}* {Enter}*/{Up}

; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.

; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.
