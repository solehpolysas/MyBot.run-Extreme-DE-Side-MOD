; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Options
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......: solehpolysas a.k.a Rizor
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

	$tabExtra = GUICtrlCreateTabItem("Extra")

;Gready SWT
	Local $x = 30, $y = 150
	$grpOnGready = GUICtrlCreateGroup(GetTranslated(10,2, "Greedy Option"), $x - 20, $y - 20, 445, 65)
	$chkSWTGreedy = GUICtrlCreateCheckbox("Activate Greedy in SWT Only", $x-10, $y, -1, -1)
		$txtTip = "Check if you want activate greedy when bot Snipe While Train."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetState(-1, $GUI_CHECKED)
	$y += 22
;Gready Snipe Combo top
	$chkGreedy = GUICtrlCreateCheckbox("Activate Greedy in Snipe Combo", $x - 10 , $y, -1, -1)
	$txtTip = "Check if you want activate greedy in Snipe Combo."
	GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetState(-1, $GUI_CHECKED)
	$y += 22
;Gready Snipe Combo bottom

GUICtrlCreateTabItem("")
