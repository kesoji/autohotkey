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

;;; Program Path ;;;
App_explorer = "C:\Windows\explorer.exe"
App_browser := "C:\Program Files\Google\Chrome\Application\chrome.exe"
App_editor := "C:\Windows\notepad.exe"
App_pdfviewer := "C:\Program Files\Adobe\Reader 11.0\Reader\AcroRd32.exe"

; !! OVERRIDE PROGRAM PATH !!
#Include LocalOnly.ahk


;;; Windows Key Customize ;;;
#a::
    Save := Clipboard
    Send ^c
    Sleep 500
    Run %App_pdfviewer% "%Clipboard%"
    Clipboard := Save
    Return
;#b::
#c::Run https://www.google.com/calendar/render
;#d:: ;Show Desktop
;#e:: ;Show Explorer
;#f:: ;Search
#g::
    Save := Clipboard
    Send ^c
    Sleep 500
    Run "https://www.google.co.jp/search?q=%Clipboard%&oq=&gs_l=&pbx=1&hl=ja"
    Clipboard := Save
    Return
;#h::
#i::Run "C:\Program Files\Internet Explorer\iexplore.exe"
;#j::
;#k::
;#l:: ;Lock
;#m:: ;Minimize window
;#n::
;#o::
;#p::
;#q::
;#r::
#s::
    Send {F2}
    Sleep 50
    Send ^c
    Run "C:\Users\sakuradak94\Documents\Local_Apps\Everything\Everything.exe"
    Sleep 1000
    Send ^v
    Send {BS}{BS}{BS}{BS}{BS}{BS}
    Return
#t::Run http://thecolourclock.co.uk/
;#u::
;#v::
;#w::
;#x::
#y::
    WinGet, tp, Transparent, A
    If tp =
        Winset, Transparent, 160, A
    Else
        Winset, Transparent, OFF, A
    Return
;#z::

;;; Henkan Muhenkan Customize ;;;
sc07B & 0::Reload
sc07B & 1::Send,^+{Tab}
sc07B & 2::Send,^{Tab}
sc07B & 3::Send,!{Left}
sc07B & 4::Send,!{Right}
sc07B & 5::
    Save := Clipboard
    Send ^c
    Sleep 300
    StringReplace, Clipboard, Clipboard, /, \, All
    Clipboard := RegExReplace(Clipboard, "[<>]", "")
    Run %App_explorer% "%Clipboard%"
    Sleep 300
    Clipboard := Save
    Return
sc07B & 6::
    Save := Clipboard
    Send ^c
    Sleep 300
    Run %App_browser% "%Clipboard%"
    Sleep 300
    Clipboard := Save
    Return
sc07B & 7::
    Save := Clipboard
    Send ^c
    Sleep 300
    StringReplace, Clipboard, Clipboard, /, \, All
    Run %App_editor% "%Clipboard%"
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
sc079 & MButton::
    old := Clipboard
    Send ^c
    Sleep 50
    Run http://eow.alc.co.jp/search?q=%Clipboard%
    Clipboard := old
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
sc079 & t::Send,{Blind}{Home}+{End}
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
sc07B & Up::send,Å™
sc079 & Up::send,Å™
sc07B & Down::send,Å´
sc079 & Down::send,Å´
sc07B & Right::send,Å®
sc079 & Right::send,Å®
sc07B & Left::send,Å©
sc079 & Left::send,Å©
sc07B & [::JapaneseBracketOpen()
sc079 & [::JapaneseBracketOpen()
sc07B & ]::JapaneseBracketClose()
sc079 & ]::JapaneseBracketClose()
sc07B & /::JapaneseQuestionAndBikkuri()
sc079 & /::JapaneseQuestionAndBikkuri()

sc07B & m::
    FromExcelPasteDoubleQuoteReplace()
    Send ^v
    Sleep 50
    Send, {BS}
    return

;;; Utilities ;;;
;; Mail
:*:fme::from:me
:*:tme::to:me
;; Excel
:*:`=IDR::=INDIRECT()
:*:`=IDX::=INDEX()
:*:`=NW::=NOW()
:*:`#dbg::Debug.Print 
;; Perl
:*:usuw::use strict;{Enter}use warnings;
;; Javascript
:*:jsdq::/**{Enter}* {Enter}*/{Up}
;; Linux
:*:'eL::export LANG=ja_JP.UTF-8
:*:'eP::export PS1="\[\e[1;34m\][\u@\h \W]$ \[\e[00m\]"
:*:s-v::set -o vi{Enter}
:*:'gip::/sbin/ip a|grep inet
:*:'ip::/sbin/ip a|grep inet
:*:grepl::grep --line-buffered 
:*:egrepl::egrep --line-buffered 
:*:fgrepl::fgrep --line-buffered 
:*:'log::Logger.log();{Left}{Left}
:*:vbar::|
:*:2dv::2>/dev/null
;; Regular Expression
:*:'igai::{^}(?{!}.*).*${Left 4}
;; Date and Time
:*: ]d::
    FormatTimeAndPaste("yyyy/MM/dd")
    return
:*: ]cd::
    FormatTimeAndPaste("yyyy/M/d")
    return
:*: ]md::
    formattimeandpaste("MM/dd")
    return
:*: ]cm::
    formattimeandpaste("[MM/dd ]")
    Send,{Left}
    return
:*: ]e::
    FormatTimeAndPaste("yyyyMMdd")
    return
:*: ]t::
    FormatTimeAndPaste("HH:mm")
    return
:*: ]p::
    FormatTimeAndPaste("HH:mm:ss")
    return
:*: ]fd::
    formattimeandpaste("_yyyyMMdd")
    return
:*: ]yd::
    FormatTimeAndPaste("yyyy/MM/dd (ddd)")
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

JapaneseBracketOpen() {
    If GetKeyState("Shift","P")
        Send,Åw
    Else
        Send,Åy
}
JapaneseBracketClose() {
    If GetKeyState("Shift","P")
        Send,Åx
    Else
        Send,Åz
}
JapaneseQuestionAndBikkuri() {
    If GetKeyState("Shift", "P")
        Send,ÅI
    Else
        Send,ÅH
}

; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.

; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.
