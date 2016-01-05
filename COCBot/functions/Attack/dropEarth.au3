; #FUNCTION# ====================================================================================================================
; Name ..........: Drops EarthQuake and CC Spell (EarthQuake)
; Description ...: Drops EarthQuake, given the spell and x, y coordinates.
; Syntax ........: dropEarth($x, $y, $spell)
; Parameters ....: $x                   - X location.
;                  $y                   - Y location.
;                  $spell               - spell
; Return values .: None
; Author ........:
; Modified ......: Lakereng 2016 And Extreme DE Side MOD TeaM
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func dropEarth($x, $y, $spell = -1)
	; $debugSetlog = 1
	Local $aDeployButtonPositions = getUnitLocationArray()
	; $debugSetlog = 0

	; Check to make sure we are trying to use an earthquake spell.
	If $spell = $eESpell Then
		Local $barPosition = $aDeployButtonPositions[$spell]
		Local $barCCSpell	= $aDeployButtonPositions[$eCCSpell]
		Local $spellCount = spellCount($spell)
		Local $ccSpellCount = unitCount($eCCSpell)

		; Check to see if the filter says to wait for the king.
		If $LBBKEQFilter = 1 And $King = -1 Then
			SetLog("Saving earthquake for when the king is present")
			Return
		EndIf

		; Check to see if we have an earthquake spell in the CC and it hasn't be used
		If getCCSpellType() = $spell And $barCCSpell <> -1 And $ccSpellCount > 0 Then
			If _Sleep(100) Then Return
			If $debugSetlog = 1 Then SetLog("Dropping Clan Castle " & getTranslatedTroopName($spell) & " in slot " & $barCCSpell, $COLOR_BLUE)

			Click(GetXPosOfArmySlot($barCCSpell, 68) + 80, 595 + $bottomOffsetY, 1, 0, "#0094")
			SetLog("Dropping " & getTranslatedTroopName($spell) & " in the Clan Castle", $COLOR_RED)
			Click($x, $y, 1, 50)
		EndIf

		; Check to see if we have an earthquake spell trained
		If $barPosition <> -1 And $spellCount > 0 Then
			If _Sleep(100) Then Return
			If $debugSetlog = 1 Then SetLog("Dropping " & getTranslatedTroopName($spell) & " in slot " & $barPosition, $COLOR_BLUE)

			Click(GetXPosOfArmySlot($barPosition, 68), 595 + $bottomOffsetY, 1, 0, "#0094")
			SetLog("Dropping " & getTranslatedTroopName($spell), $COLOR_RED)
			Click($x, $y, 4, 50)
		EndIf
	EndIf
EndFunc   ;==>dropEarth
