; #FUNCTION# ====================================================================================================================
; Name ..........: DrillZapSpell
; Description ...: This file Includes all functions to current GUI
; Syntax ........: DrillZapSpell()
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......: bushido-21
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
local $Spellslot

Func DrillZapSpell()

   Local $NextPos = _PixelSearch(749, 311 + $midOffsetY, 787, 322 + $midOffsetY, Hex(0xF08C40, 6), 5)
   Local $PrevPos = _PixelSearch(70, 311 + $midOffsetY, 110, 322 + $midOffsetY, Hex(0xF08C40, 6), 5)


	If WaitforPixel(28, 505 + $bottomOffsetY, 30, 507 + $bottomOffsetY, Hex(0xE4A438, 6), 5, 10) Then
		If $debugSetlog = 1 Then SetLog("Click $aArmyTrainButton", $COLOR_GREEN)
		If IsMainPage() Then Click($aArmyTrainButton[0], $aArmyTrainButton[1], 1, 0, "#0293") ; Button Army Overview
		EndIf
	If _Sleep($iDelayRunBot6) Then Return ; wait for window to open
	If Not (IsTrainPage()) Then Return ; exit if I'm not in train page

_Sleep($iDelayTrain3)
click(751,350,7,300)



   If $ichkTrainLightSpell = 1 Then
	   $iBarrHere = 0
			While Not (isSpellFactory())
				If Not (IsTrainPage()) Then Return
				If IsArray($NextPos) Then _TrainMoveBtn(+1) ;click prev button
				$iBarrHere += 1
				If _Sleep($iDelayTrain3) Then ExitLoop
				If $iBarrHere = 8 Then ExitLoop
			WEnd
		If isSpellFactory() Then
			Local $x = 0
			If $chkTrainLightSpell = 1 Then
				$Spellslot = 0
			 EndIf
			If $Spellslot <> -1 Then
			While 1
				_CaptureRegion()
			If _sleep($iDelayTrain2) Then Return
					If _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
					setlog("Spell Factory Full", $COLOR_RED)
						ExitLoop
				    Else
					        GemClick(252 + ($Spellslot * 105), 354 + $midOffsetY, 1, $iDelayTrain6, "#0290")
					    $x = $x + 1
				EndIf
				If $x = 1 Then
					ExitLoop
				EndIf
			WEnd
			If $x = 0 Then
			Else
						SetLog("Created 1  LightningSpell  Spell(s)", $COLOR_BLUE)
				EndIf
			EndIf
		Else
			SetLog("Spell Factory not found...", $COLOR_BLUE)
		EndIf
	Else
	EndIf ; End Spell Factory
	If _Sleep($iDelayTrain4) Then Return
	ClickP($aAway, 2, $iDelayTrain5, "#0291"); Click away twice with 250ms delay
	$FirstStart = False

EndFunc