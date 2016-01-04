; #FUNCTION# ====================================================================================================================
; Name ..........: unitInfo.au3
; Description ...: Gets various information about units such as thenumber, location on the bar, clan castle spell type etc...
; Syntax ........:
; Parameters ....:
; Return values .:
; Author ........: @ancient
; Modified ......: #LunaEclipse
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func unitLocation($kind) ; Gets the location of the unit type on the bar.
	Local $return = -1
	Local $i = 0

	; This loops through the bar array but allows us to exit as soon as we find our match.
	While $i < UBound($atkTroops)
		; $atkTroops[$i][0] holds the unit ID for that position on the deployment bar.
		If $atkTroops[$i][0] = $kind Then
			$return = $i
			ExitLoop
		EndIf

		$i += 1
	WEnd

	; This returns -1 if not found on the bar, otherwise the bar position number.
	Return $return
EndFunc   ;==>unitLocation

Func getCCSpellType() ; Returns the type of spell currently in the clan castle.
	Local $barLocation = unitLocation($eCCSpell)

	; $barLocation is -1 if there is no entry on the deployment bar allocated as a clan castle spell.
	If $barLocation <> -1 Then
		If $debugSetlog = 1 Then SetLog($unitText & " found in the clan castle", $COLOR_PURPLE)
	Else
		If $debugSetlog = 1 Then SetLog("No clan castle spell found", $COLOR_PURPLE)
	EndIf

	return $CCSpellType
EndFunc   ;==>getCCSpellType

Func unitCount($kind) ; Gets a count of the number of units of the type specified.
	Local $numUnits = 0
	Local $unitText = getTranslatedTroopName($kind)
	Local $barLocation = unitLocation($kind)

	; $barLocation is -1 if the unit/spell type is not found on the deployment bar.
	If $barLocation <> -1 Then
		$numUnits = $atkTroops[unitLocation($kind)][1]
		If $debugSetlog = 1 Then SetLog($numUnits & " " & $unitText & "'s in slot " & $barLocation, $COLOR_PURPLE)
	EndIf

	Return $numUnits
EndFunc   ;==>unitCount

Func spellCount($kind) ; Gets a count of the number of spells of the type specified.
	Local $numSpells = 0
	Local $numCCSpells = 0
	Local $spellText = getTranslatedTroopName($kind)
	Local $barLocation = unitLocation($kind)
	Local $barLocationCCSpell = unitLocation($eCCSpell)

	$numSpells = unitCount($kind)

	; $barLocationCCSpell is -1 if a clan castle spell is not found on the deployment bar.
	; clan castle spells are designated as the second entry on the deployment bar for a spell
	If $barLocationCCSpell <> -1 And getCCSpellType() = $kind Then
		; Clan castle is also this spell
		$numCCSpells = unitCount($eCCSpell)
		If $debugSetlog = 1 Then SetLog(($numSpells - 1) & " " & $spellText & "'s in slot " & $barLocation & " and " & $numCCSpells & " " & $spellText & " in the Clan Castle", $COLOR_PURPLE)
	Else
		If $debugSetlog = 1 Then SetLog($numSpells & " " & $spellText & "'s in slot " & $barLocation, $COLOR_PURPLE)
	EndIf

	Return $numSpells
EndFunc   ;==>spellCount
