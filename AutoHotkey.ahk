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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Program Path
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
App_explorer   := "C:\Windows\explorer.exe"
App_browser    := "C:\Program Files\Google\Chrome\Application\chrome.exe"
App_editor     := "C:\Windows\notepad.exe"
App_pdfviewer  := "C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat\Acrobat.exe"
App_everything := "C:\Program Files\Everything\Everything.exe"
; !! OVERRIDE PROGRAM PATH !!
#Include LocalOnly.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; IME script
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#Include IME.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; IME on/off with alt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; https://github.com/karakaram/alt-ime-ahk

; 左右 Alt キーの空打ちで IME の OFF/ON を切り替える
;
; 左 Alt キーの空打ちで IME を「英数」に切り替え
; 右 Alt キーの空打ちで IME を「かな」に切り替え
; Alt キーを押している間に他のキーを打つと通常の Alt キーとして動作
;
; Author:     karakaram   http://www.karakaram.com/alt-ime-on-off

;#Include IME.ahk

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
#MaxHotkeysPerInterval 350

; 主要なキーを HotKey に設定し、何もせずパススルーする
*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
*~Space::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
    Return

; 上部メニューがアクティブになるのを抑制
*~LAlt::Send {Blind}{vk07}
*~RAlt::Send {Blind}{vk07}

; 左 Alt 空打ちで IME を OFF
LAlt up::
    if (A_PriorHotkey == "*~LAlt")
    {
        IME_SET(0)
    }
    Return

; 右 Alt 空打ちで IME を ON
RAlt up::
    if (A_PriorHotkey == "*~RAlt")
    {
        IME_SET(1)
    }
    Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Windows Key Customize
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#Include Winkey.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Mouses Customize
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~RButton & WheelDown::Send,^{Tab}
~RButton & WheelUp::Send,^+{Tab}
^MButton::Send,{Delete}

>!0::Reload
>!9::ShellRun(App_editor, A_ScriptFullPath)
^[::Send {Esc}
^h::Send % GetKeyState("Space", "P") ? "{Left}"  : "^h"
^j::Send % GetKeyState("Space", "P") ? "{Down}"  : "^j"
^k::Send % GetKeyState("Space", "P") ? "{Up}"    : "^k"
^l::Send % GetKeyState("Space", "P") ? "{Right}" : "^l"
^w::Send % GetKeyState("Space", "P") ? "{PgUp}"  : "^w"
^e::Send % GetKeyState("Space", "P") ? "{PgDn}"  : "^e"
>!h::Send {Left}
>!j::Send {Down}
>!k::Send {Up}
>!l::Send {Right}
!+h::Send !+{Left}
!+j::Send !+{Down}
!+k::Send !+{Up}
!+l::Send !+{Right}
!h::Send % AltFlg ? "{Left}"  : "!h"
!j::Send % AltFlg ? "{Down}"  : "!j"
!k::Send % AltFlg ? "{Up}"    : "!k"
!l::Send % AltFlg ? "{Right}" : "!l"

>!z::Send {Home}
!z::Send % AltFlg ? "{Home}" : "!h"
>!x::Send {End}
!x::Send % AltFlg ? "{End}" : "!h"

!Backspace::Send {Delete}

; Toggle Left Alt
>^/::AltFlg := AltFlg ? false : true
$Ctrl::
    Keywait, Ctrl, U
    Keywait, Ctrl, D T0.2
    If (ErrorLevel=1) ;直前のコマンド＝Keywaitがタイムアウトで失敗＝1なら
        Send, {Ctrl}
    Else
        AltFlg := AltFlg ? false : true
    Return


; LButton::
; If GetKeyState("RButton", "P")
;     send, {Blind}{Return}
; Else
;     Click
; Return
^Q::Send, !{F4}

;;; Mouse Key
;d & h::
;d & j::
;d & k::
;d & l::
;    While (GetKeyState("d", "P"))
;    {
;        MoveX := 0, MoveY := 0
;        MoveX += GetKeyState("h", "P") ? -11 : 0	;GetKeyState() と ?:演算子(条件) (三項演算子) の組み合わせ
;        MoveY += GetKeyState("j", "P") ? 11 : 0
;        MoveY += GetKeyState("k", "P") ? -11 : 0
;        MoveX += GetKeyState("l", "P") ? 11 : 0
;        MouseMove, %MoveX%, %MoveY%, 1, R		;マウスカーソルを移動する
;        Sleep, 0					;負荷が高い場合は設定を変更 設定できる値は-1、0、10～m秒 詳細はSleep
;    }
;    Return

;;; Henkan/Muhenkan
;;; Disable Katakana / Hiragana
sc070::Return

try {
    sc07B::sc07B
    sc079::Send, {sc079}
} catch e {
    msgbox e
    msgbox "hoge"
}

sc07B & 0::Reload
sc079 & 0::Reload
sc07B & 1::Send,^+{Tab}
sc07B & 2::Send,^{Tab}
sc07B & 3::Send,!{Left}
sc07B & 4::Send,!{Right}
sc07B & 5::
    Save := Clipboard
    Send ^c
    Sleep 300
    StringReplace, Clipboard, Clipboard, /, \, All
    Clipboard := RegExReplace(Clipboard, "[<>＜＞]", "")
    Clipboard := RegExReplace(Clipboard, "^[ 　]*", "")
    Clipboard := RegExReplace(Clipboard, "[ 　]+$", "")
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
    ShellRun(App_editor, Clipboard)
    Sleep 300
    Clipboard := Save
    Return
sc07B & 9::ShellRun(App_editor, A_ScriptFullPath)
sc079 & 9::ShellRun(App_editor, A_ScriptFullPath)
sc07B & -::Send ^{NumpadAdd} ;Auto resize column on Explorer
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

sc079 & d::MouseClick
sc079 & f::MouseClick, Right
sc079 & c::MouseClick, Left, , , , D
sc079 & v::MouseClick, Left, , , , U
; HJKL
sc07B & h::Send,{Blind}{Left}
sc07B & j::
    if (GetKeyState("LWin", "P")) {
        Send, #^{Right}
    } else {
        Send,{Blind}{Down}
    }
    Return
sc07B & k::
    if (GetKeyState("LWin", "P")) {
        Send, #^{Left}
    } else {
        Send,{Blind}{Up}
    }
    Return
sc07B & l::Send,{Blind}{Right}
sc079 & l::
sc079 & k::
sc079 & j::
sc079 & h::
    While (GetKeyState("sc079", "P")) {
        if (GetKeyState("sc07B", "P"))        {
            MoveX := 0, MoveY := 0
            MoveX += GetKeyState("h", "P") ? -10 : 0
            MoveY += GetKeyState("j", "P") ? 10 : 0
            MoveY += GetKeyState("k", "P") ? -10 : 0
            MoveX += GetKeyState("l", "P") ? 10 : 0
            MouseMove, %MoveX%, %MoveY%, 0, R ;0(fastest)-100(slowest)
        }
        else{
            MoveX := 0, MoveY := 0
            MoveX += GetKeyState("h", "P") ? -100 : 0
            MoveY += GetKeyState("j", "P") ? 100 : 0
            MoveY += GetKeyState("k", "P") ? -100 : 0
            MoveX += GetKeyState("l", "P") ? 100 : 0
            MouseMove, %MoveX%, %MoveY%, 0, R ;0(fastest)-100(slowest)
        }
    }
    Return
; WASD
sc07B & a::Send,{Blind}{Left}
sc07B & s::Send,{Blind}{Down}
sc07B & w::Send,{Blind}{Up}
sc07B & d::Send,{Blind}{Right}
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
sc07B & Up::send,↑
sc079 & Up::send,↑
sc07B & Down::send,↓
sc079 & Down::send,↓
sc07B & Right::send,→
sc079 & Right::send,→
sc07B & Left::send,←
sc079 & Left::send,←
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

sc07B & v::
    If GetKeyState("Ctrl", "P")
        AddAngleBracketAndPaste()
    Else {
        ChangeLfToCrLfFromClipboard()
        Send ^v
    }
    return

^n::
    if (WinActive("ahk_class keypirinha_wndcls_run")) {
        Send,{Down}
    } else {
        Send,^n
    }
    return
^p::
    if (WinActive("ahk_class keypirinha_wndcls_run")) {
        Send,{Up}
    } else {
        Send,^p
    }
    return

;;; Utilities ;;;
;; Windows
:*:1000@::10:00
:*:1100@::11:00
:*:1200@::12:00
:*:1300@::13:00
:*:1400@::14:00
:*:1500@::15:00
:*:1600@::16:00
:*:1700@::17:00
:*:1800@::18:00
:*:1900@::19:00
:*:2000@::20:00
:*:'dskq::
    Clipboard = %A_Desktop%
    Send ^v
    return
;; Typo
:*:localhsot::localhost
;; Util
:*:curlslack::curl -d '{{}"text":"hoge"{}}'{Space}
:*:curlxml::curl -XPOST -H "Content-type: text/xml" --data-binary @
;; Mail
:*:'fme::from:me
:*:'tme::to:me
;; Excel
:*:`=IDR::=INDIRECT()
:*:`=IDX::=INDEX()
:*:`=NW::=NOW()
:*:`#dbg::Debug.Print{Space}
;; Perl
:*:usuw::use strict;{Enter}use warnings;
;; Shell
:*:shellq::{#}{!}/bin/bash{Enter}set -Ceu
;; Javascript
:*:jsdq::/**{Enter}* {Enter}*/{Up}
;; Linux
:*:checkcron::for i in ``\ls -R1 --color=none /etc/cron* /var/spool/cron```; do echo $i | grep -q ":$"; if [ $? -eq 0 ]; then echo -e "{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}\n$i\n{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}{#}"; DIR=${{}i`%`%:{}}/; else echo -e "\e[37;42;1m${{}DIR{}}$i\e[m"; cat ${{}DIR{}}$i| grep -v "{^}{#}"; fi; done; unset DIR
:*:{{bk::{{},.bak{}}
:*:'eL::export LANG=ja_JP.UTF-8
:*:'eP::export PS1="\[\e[1;34m\][\u@\h \W]$ \[\e[00m\]"
:*:'vimi::apt update && apt install -y vim{Space}
:*:s-v::set -o vi{Enter}
:*:'gip::/sbin/ip a|grep inet
:*:'ip::/sbin/ip a|grep inet
:*:grepl::grep --line-buffered{Space}
:*:egrepl::egrep --line-buffered{Space}
:*:fgrepl::fgrep --line-buffered{Space}
:*:vlm::/var/log/messages
:*:/vl::/var/log/
:*:'log::Logger.log();{Left}{Left}
:*:vbar::
:*:2dv::2>/dev/null
:*:12dv::>/dev/null 2>&1
:*:{to::{,.org}
:*:{fo::{.org,}
:*:'ctop::docker run --rm -ti --name=ctop -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest
:*:nginxreload::nginx -t && nginx -s reload
;; Openssl
:*:-teno::-text -noout  {BS}
;; Regular Expression
:*:'igai::{^}(?{!}.*).*${Left 4}
;; Git
:*:gghub::git@github.com:
:*:gglab::git@gitlab.com:
:*:gitnp:: git --no-pager 
:*:gstaf::"style: autofmt"
;; Docker
:*:venvrc::echo "export DOCKER_VOLUME_PATH_BASE=``pwd``" >> .envrc
;; Ruby / Rails
:*:buer::bundle exec rails 
:*:buex::bundle exec 
;; Markdown
:*:``rb::``````ruby{Enter}{Enter}``````{Up}
:*:``pp::``````php{Enter}{Enter}``````{Up}
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
    FormatTimeandPaste("_yyyyMMdd")
    return
:*: ]yd::
    FormatTimeAndPaste("yyyy/MM/dd (ddd)")
    return
:*: ]yyd::
    FormatTimeAndPaste("M月d日(ddd)")
    return

; 定型文
::gkari::ご確認ありがとうございました。
::itq::
    SendInput,{Enter}{Enter}いつもお世話になっております。%MyFamilyName%です。{Enter}{Enter}{Enter}{Enter}よろしくお願いいたします。{Enter}%MyFamilyName%{Up}{Up}{Up}
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

ChangeLfToCrLfFromClipboard() {
    StringReplace, Clipboard, Clipboard, `n, `r`n, All
}

ChangeCrLfToReturnFromClipboard() {
    StringReplace, Clipboard, Clipboard, `r`n, \n, All
}

AddAngleBracketAndPaste() {
    Save := Clipboard
    Clipboard := RegExReplace(Clipboard, "m)^", "> ")
    Send ^v
    Sleep 500
    Clipboard := Save
}
JapaneseBracketOpen() {
    If GetKeyState("Shift","P")
        Send,『
    Else
        Send,【
}
JapaneseBracketClose() {
    If GetKeyState("Shift","P")
        Send,』
    Else
        Send,】
}
JapaneseQuestionAndBikkuri() {
    If GetKeyState("Shift", "P")
        Send,！
    Else
        Send,？
}

;;; for Vim
;;; 機能していない説ある
; For Terminal/Vim
GroupAdd Terminal, ahk_class PuTTY
GroupAdd Terminal, ahk_class mintty ; cygwin
GroupAdd TerminalVim, ahk_group Terminal
GroupAdd TerminalVim, ahk_class Vim
GroupAdd TerminalVim, ahk_class GVIM

; ESC + IME
#IfWInActive, ahk_group TerminalVim
Esc:: ; Just send Esc at converting.
  if (IME_GET(A)) {
    if (IME_GetConverting(A)) {
      Send,{Esc}
    } else {
      IME_SET(1)
    }
  } else {
    Send,{Esc}
  }
  Return
^[:: ; Go to Normal mode (for vim) with IME off even at converting.
  if (IME_GET(A)) {
    Send,{Esc}
    Sleep 1 ; wait 1 ms (Need to stop converting)
    IME_SET(1)
    Send,{Esc}
  } else {
    Send,{Esc}
  }
  Return
#IfWInActive

; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.

; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.


/*
  ShellRun by Lexikos
    requires: AutoHotkey_L
    license: http://creativecommons.org/publicdomain/zero/1.0/

  Credit for explaining this method goes to BrandonLive:
  http://brandonlive.com/2008/04/27/getting-the-shell-to-run-an-application-for-you-part-2-how/

  Shell.ShellExecute(File [, Arguments, Directory, Operation, Show])
  http://msdn.microsoft.com/en-us/library/windows/desktop/gg537745
*/
ShellRun(prms*)
{
    shellWindows := ComObjCreate("{9BA05972-F6A8-11CF-A442-00A0C90A8F39}")

    desktop := shellWindows.Item(ComObj(19, 8)) ; VT_UI4, SCW_DESKTOP

    ; Retrieve top-level browser object.
    if ptlb := ComObjQuery(desktop
        , "{4C96BE40-915C-11CF-99D3-00AA004AE837}"  ; SID_STopLevelBrowser
        , "{000214E2-0000-0000-C000-000000000046}") ; IID_IShellBrowser
    {
        ; IShellBrowser.QueryActiveShellView -> IShellView
        if DllCall(NumGet(NumGet(ptlb+0)+15*A_PtrSize), "ptr", ptlb, "ptr*", psv:=0) = 0
        {
            ; Define IID_IDispatch.
            VarSetCapacity(IID_IDispatch, 16)
            NumPut(0x46000000000000C0, NumPut(0x20400, IID_IDispatch, "int64"), "int64")

            ; IShellView.GetItemObject -> IDispatch (object which implements IShellFolderViewDual)
            DllCall(NumGet(NumGet(psv+0)+15*A_PtrSize), "ptr", psv
                , "uint", 0, "ptr", &IID_IDispatch, "ptr*", pdisp:=0)

            ; Get Shell object.
            shell := ComObj(9,pdisp,1).Application

            ; IShellDispatch2.ShellExecute
            shell.ShellExecute(prms*)

            ObjRelease(psv)
        }
        ObjRelease(ptlb)
    }
}
