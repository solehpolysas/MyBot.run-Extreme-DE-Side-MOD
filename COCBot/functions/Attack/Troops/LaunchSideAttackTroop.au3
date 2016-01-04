Func LaunchSideAttackTroop($listInfoDeploy, $CC, $King, $Queen, $Warden)
	Local $listListInfoDeployTroopPixel[0]
	Local $earthquakeDropped = 0
	Local $barPosition = -1
	Local $spellCount = 0
	Local $unitCount = 0
	Local $kind

	If $debugSetlog = 1 Then SetLog("LaunchTroop2 with CC " & $CC & ", K " & $King & ", Q " & $Queen & ", W " & $Warden , $COLOR_PURPLE)

	If $iMatchMode = $LB And $iChkDeploySettings[$LB] >= 5 Then ; Used for DE or TH side attack
		Local $RandomEdge = $Edges[$BuildingEdge]
		Local $RandomXY = 2
	Else
		Local $RandomEdge = $Edges[Round(Random(0, 3))]
		Local $RandomXY = Round(Random(0, 4))
	EndIf

;	$debugSetlog = 1
	Local $aDeployButtonPositions[$eCCSpell]
;	$debugSetlog = 0

	For $i = 0 To UBound($listInfoDeploy) - 1
		$kind = $listInfoDeploy[$i][0]
		$barPosition = $aDeployButtonPositions[$kind]

		If $kind <> $DeDeployEmptyString Then
			If $kind = "HEROES" Then ; Special case for old deployments with HEROS as a string.
				dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $King, $Queen, $Warden)
			ElseIf $barPosition <> -1 Then
				Select
					Case $kind = $eKing
						If $LBBKEQFilter = 0 OR $earthquakeDropped = 1  Then
							dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $King, -1, -1)
						Else
							SetLog("Saving king for earthquakes")
						EndIf
					Case $kind = $eQueen
						dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], -1, $Queen, -1)
					Case $kind = $eWarden
						dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], -1, -1, $Warden)
					Case $kind = $eCastle Or $kind = "CC"
						dropCC($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $CC)
					Case $kind = $eRSpell Or $kind = $eHSpell Or $kind = $eJSpell Or $kind = $eHaSpell Or $kind = $eFSpell Or $kind = $ePSpell
						$spellCount = spellCount($kind)

						If $spellCount > 0 Then
							SetLog("Dropping spell " & getTranslatedTroopName($kind) & " at " & $listInfoDeploy[$i][4] & "% distance")
							If $BuildingLoc = 1 Then
								;drop spell towards the DE storage
								dropSpell(ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][0])+($listInfoDeploy[$i][4]*$BuildingLocx))/100), _
										  ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][1])+($listInfoDeploy[$i][4]*$BuildingLocy))/100), _
										  $kind)
							Else
								;drop spell towards the center
								dropSpell(ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][0])+($listInfoDeploy[$i][4]*430))/100), _
										  ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][1])+($listInfoDeploy[$i][4]*313))/100), _
										  $kind)
							EndIf
						EndIf
					Case $kind = $eESpell
	;					$debugSetlog = 1
						$spellCount = spellCount($kind)

						If $spellCount >= 4 Then ;4 quakes or go home
							SetLog("Dropping earth at " & $listInfoDeploy[$i][4] & "% distance")

							If $BuildingLoc = 1 Then
								;drop spell towards the DE storage
								dropEarth(ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][0])+($listInfoDeploy[$i][4]*$BuildingLocx))/100), _
										  ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][1])+($listInfoDeploy[$i][4]*$BuildingLocy))/100), _
										  $kind)
							Else
								;drop spell towards the center
								dropEarth(ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][0])+($listInfoDeploy[$i][4]*430))/100), _
										  ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][1])+($listInfoDeploy[$i][4]*313))/100), _
										  $kind)
							EndIf

							$earthquakeDropped = 1
						Else
							If $spellCount > 0 and $spellCount < 4 Then SetLog("Only " & $spellCount & " " & getTranslatedTroopName($kind) & "s available.  Waiting for 4.")
						EndIf

	;					$debugSetlog = 0
					Case Else
						$unitCount = unitCount($kind)

						If $unitCount > 0 Then
							If LauchTroop($kind, $listInfoDeploy[$i][1], $listInfoDeploy[$i][2], $listInfoDeploy[$i][3], $listInfoDeploy[$i][4]) Then
								If _Sleep(SetSleep(1)) Then Return
							EndIf
						EndIf
				EndSelect
			EndIf
		EndIf
	Next

	Return True
EndFunc   ;==>LaunchSideAttackTroop
