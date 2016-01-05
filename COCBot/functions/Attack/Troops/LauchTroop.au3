Func LauchTroop3($troopKind, $nbSides, $waveNb, $maxWaveNb, $slotsPerEdge = 0)
	Local $troop = -1
	Local $troopNb = 0
	Local $name = ""
	For $i = 0 To UBound($atkTroops) - 1 ; identify the position of this kind of troop
		If $atkTroops[$i][0] = $troopKind Then
			$troop = $i
			$troopNb = Ceiling($atkTroops[$i][1] / $maxWaveNb)
			Local $plural = 0
			If $troopNb > 1 Then $plural = 1
			$name = NameOfTroop($troopKind, $plural)
		EndIf
	Next

	If ($troop = -1) Or ($troopNb = 0) Then
		;if $waveNb > 0 Then SetLog("Skipping wave of " & $name & " (" & $troopKind & ") : nothing to drop" )
		Return False; nothing to do => skip this wave
	EndIf

	Local $waveName = "first"
	If $waveNb = 2 Then $waveName = "second"
	If $waveNb = 3 Then $waveName = "third"
	If $maxWaveNb = 1 Then $waveName = "only"
	If $waveNb = 0 Then $waveName = "last"
	SetLog("Dropping " & $waveName & " wave of " & $troopNb & " " & $name, $COLOR_GREEN)

	DropTroop3($troop, $nbSides, $troopNb, $slotsPerEdge)
	Return True
 EndFunc

Func LauchTroop($kind, $nbSides, $waveNb, $maxWaveNb, $slotsPerEdge = 0)
	Local $troop = unitLocation($kind)
	Local $troopNb = Ceiling(unitCount($kind) / $maxWaveNb)
	Local $name = getTranslatedTroopName($kind)

	If ($troop = -1) Or ($troopNb = 0) Then ; Troop not trained or 0 units to deploy
		;if $waveNb > 0 Then SetLog("Skipping wave of " & $name & " (" & $troopKind & ") : nothing to drop" )
		Return False; nothing to do => skip this wave
	EndIf

	Local $waveName = "first"

	If $waveNb = 2 Then $waveName = "second"
	If $waveNb = 3 Then $waveName = "third"
	If $maxWaveNb = 1 Then $waveName = "only"
	If $waveNb = 0 Then $waveName = "last"

	SetLog("Dropping " & $waveName & " wave of " & $troopNb & " " & $name, $COLOR_GREEN)
	DropTroop($troop, $nbSides, $troopNb, $slotsPerEdge)

	Return True
EndFunc   ;==>LauchTroop

Func LaunchTroop2($listInfoDeploy, $CC, $King, $Queen, $Warden)
	Local $listListInfoDeployTroopPixel[0]

	Local $isCCDropped = False
	Local $isHeroesDropped = False

	Local $troop = -1
	Local $troopNb = 0
	Local $name = ""

	If $debugSetlog =1 Then SetLog("LaunchTroop2 with CC " & $CC & ", K " & $King & ", Q " & $Queen & ", W " & $Warden , $COLOR_PURPLE)

	If ($iChkRedArea[$iMatchMode]) And $iChkDeploySettings[$iMatchMode] < 4 Then
		For $i = 0 To UBound($listInfoDeploy) - 1
			$troopKind = $listInfoDeploy[$i][0]
			$nbSides = $listInfoDeploy[$i][1]
			$waveNb = $listInfoDeploy[$i][2]
			$maxWaveNb = $listInfoDeploy[$i][3]
			$slotsPerEdge = $listInfoDeploy[$i][4]
			$troop = -1
			$troopNb = 0
			$name = ""

			If $debugSetlog =1 Then SetLog("**ListInfoDeploy row " & $i & ": USE "  &$troopKind & " SIDES " &  $nbSides & " WAVE " & $waveNb & " XWAVE " & $maxWaveNb & " SLOTXEDGE " & $slotsPerEdge, $COLOR_PURPLE)

			If (IsNumber($troopKind)) Then
				$troop = unitLocation($troopKind)
				$troopNb = Ceiling(unitCount($troopKind) / $maxWaveNb)
				$name = getTranslatedTroopName($troopKind)
			EndIf

			If ($troop <> -1 And $troopNb > 0) Or IsString($troopKind) Then
				Local $listInfoDeployTroopPixel
				If (UBound($listListInfoDeployTroopPixel) < $waveNb) Then
					ReDim $listListInfoDeployTroopPixel[$waveNb]
					Local $newListInfoDeployTroopPixel[0]
					$listListInfoDeployTroopPixel[$waveNb - 1] = $newListInfoDeployTroopPixel
				EndIf
				$listInfoDeployTroopPixel = $listListInfoDeployTroopPixel[$waveNb - 1]

				ReDim $listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) + 1]
				If (IsString($troopKind)) Then
					Local $arrCCorHeroes[1] = [$troopKind]
					$listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) - 1] = $arrCCorHeroes
				Else
					Local $infoDropTroop = DropTroop2($troop, $nbSides, $troopNb, $slotsPerEdge, $name)
					$listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) - 1] = $infoDropTroop
				EndIf
				$listListInfoDeployTroopPixel[$waveNb - 1] = $listInfoDeployTroopPixel
			EndIf
		Next

	    If $saveTroops = 1 and $useFFBarchST = 1 Then

		$endbattle = False

		Setlog ("There are " & $countCollectorexposed & " collector(s) near RED LINE out of " & Ubound($PixelNearCollector) & " collectors")

		If _Sleep(1000) Then Return

		If ($countCollectorexposed/Ubound($PixelNearCollector)*100) < $percentCollectors Then

		SetLog("Change the Attack Strategy to Four Finger Barch!...")

		If _Sleep(500) Then Return

		$nbSides = 5

		Local $FFListDeploy[11][5] = [[$eGiant, $nbSides, 1, 1, 1] _
			, [$eBarb, $nbSides, 1, 1, 0] _
			, [$eArch, $nbSides, 1, 1, 0] _
			, [$eMini, $nbSides, 1, 1, 0] _
			, [$eWall, $nbSides, 1, 1, 1] _
			, [$eGobl, $nbSides, 1, 2, 0] _
			, ["CC", 1, 1, 1, 1] _
			, [$eHogs, $nbSides, 1, 1, 1] _
			, [$eWiza, $nbSides, 1, 1, 0] _
			, [$eGobl, $nbSides, 2, 2, 0] _
			, ["HEROES", 1, 2, 1, 1] _
			]


		For $i = 0 To UBound($FFListDeploy) - 1
			If (IsString($FFListDeploy[$i][0]) And ($FFListDeploy[$i][0] = "CC" Or $FFListDeploy[$i][0] = "HEROES")) Then
				Local $RandomEdge = $Edges[Round(Random(0, 3))]
				Local $RandomXY = Round(Random(0, 4))
				If ($FFListDeploy[$i][0] = "CC") Then
					dropCC($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $CC)
				ElseIf ($FFListDeploy[$i][0] = "HEROES") Then
					dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $King, $Queen)
				EndIf
			Else
				If LauchTroop3($FFListDeploy[$i][0], $FFListDeploy[$i][1], $FFListDeploy[$i][2], $FFListDeploy[$i][3], $FFListDeploy[$i][4]) Then
					If _Sleep(SetSleep(1)) Then Return
				EndIf
			EndIf
		Next

		Return

		Endif

		Endif

		If (($iChkSmartAttack[$iMatchMode][0] = 1 Or $iChkSmartAttack[$iMatchMode][1] = 1 Or $iChkSmartAttack[$iMatchMode][2] = 1) And UBound($PixelNearCollector) = 0) Then
				SetLog("Error, no pixel found near collector => Normal attack near red line")
		EndIf
		If ($iCmbSmartDeploy[$iMatchMode] = 0) Then
			For $numWave = 0 To UBound($listListInfoDeployTroopPixel) - 1
				Local $listInfoDeployTroopPixel = $listListInfoDeployTroopPixel[$numWave]
				For $i = 0 To UBound($listInfoDeployTroopPixel) - 1
					Local $infoPixelDropTroop = $listInfoDeployTroopPixel[$i]
					If (IsString($infoPixelDropTroop[0]) And ($infoPixelDropTroop[0] = "CC" Or $infoPixelDropTroop[0] = "HEROES")) Then
						;TEMP FIX NEED TO IMPROVED... IF NO PIXELREDAREA DEPLOY IN A PRECISE POINT
						;Local $pixelRandomDrop = $PixelRedArea[Round(Random(0, UBound($PixelRedArea) - 1))]
						If Ubound($PixelRedArea) > 0 Then
							Local $pixelRandomDrop = $PixelRedArea[Random(0, UBound($PixelRedArea) - 1,1)]
						Else
							Local $pixelRandomDrop = [747,367] ;
						EndIf
						;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

						If ($infoPixelDropTroop[0] = "CC") Then
							dropCC($pixelRandomDrop[0], $pixelRandomDrop[1], $CC)
						ElseIf ($infoPixelDropTroop[0] = "HEROES") Then
							dropHeroes($pixelRandomDrop[0], $pixelRandomDrop[1], $King, $Queen, $Warden)
							$isHeroesDropped = True
						EndIf
					Else
						If _Sleep($iDelayLaunchTroop21) Then Return
						SelectDropTroop($infoPixelDropTroop[0]) ;Select Troop
						If _Sleep($iDelayLaunchTroop21) Then Return
						Local $waveName = "first"
						If $numWave + 1 = 2 Then $waveName = "second"
						If $numWave + 1 = 3 Then $waveName = "third"
						If $numWave + 1 = 0 Then $waveName = "last"
						SetLog("Dropping " & $waveName & " wave of " & $infoPixelDropTroop[5] & " " & $infoPixelDropTroop[4], $COLOR_GREEN)


						DropOnPixel($infoPixelDropTroop[0], $infoPixelDropTroop[1], $infoPixelDropTroop[2], $infoPixelDropTroop[3])
					EndIf
					If ($isHeroesDropped) Then
						If _Sleep($iDelayLaunchTroop22) then return ; delay Queen Image  has to be at maximum size : CheckHeroesHealth checks the y = 573
						CheckHeroesHealth()
					EndIf
					If _Sleep(SetSleep(1)) Then Return
				Next
			Next
		Else
			For $numWave = 0 To UBound($listListInfoDeployTroopPixel) - 1
				Local $listInfoDeployTroopPixel = $listListInfoDeployTroopPixel[$numWave]
				If (UBound($listInfoDeployTroopPixel) > 0) Then
					Local $infoTroopListArrPixel = $listInfoDeployTroopPixel[0]
					Local $numberSidesDropTroop = 1

					For $i = 0 To UBound($listInfoDeployTroopPixel) - 1
						$infoTroopListArrPixel = $listInfoDeployTroopPixel[$i]
						If (UBound($infoTroopListArrPixel) > 1) Then
							Local $infoListArrPixel = $infoTroopListArrPixel[1]
							$numberSidesDropTroop = UBound($infoListArrPixel)
							ExitLoop
						EndIf
					Next

					If ($numberSidesDropTroop > 0) Then
						For $i = 0 To $numberSidesDropTroop - 1
							For $j = 0 To UBound($listInfoDeployTroopPixel) - 1
								$infoTroopListArrPixel = $listInfoDeployTroopPixel[$j]
								If (IsString($infoTroopListArrPixel[0]) And ($infoTroopListArrPixel[0] = "CC" Or $infoTroopListArrPixel[0] = "HEROES")) Then
									;TEMP FIX NEED TO IMPROVED... IF NO PIXELREDAREA DEPLOY IN A PRECISE POINT
									;Local $pixelRandomDrop = $PixelRedArea[Round(Random(0, UBound($PixelRedArea) - 1))]
									If Ubound($PixelRedArea) > 0 Then
										Local $pixelRandomDrop = $PixelRedArea[Random(0, UBound($PixelRedArea) - 1,1)]
									Else
										Local $pixelRandomDrop = [747,367] ;
									EndIf
									;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

									If ($isCCDropped = False And $infoTroopListArrPixel[0] = "CC") Then
										dropCC($pixelRandomDrop[0], $pixelRandomDrop[1], $CC)
										$isCCDropped = True
									ElseIf ($isHeroesDropped = False And $infoTroopListArrPixel[0] = "HEROES" And $i = $numberSidesDropTroop - 1) Then
										dropHeroes($pixelRandomDrop[0], $pixelRandomDrop[1], $King, $Queen, $Warden)
										$isHeroesDropped = True
									EndIf
								Else
									$infoListArrPixel = $infoTroopListArrPixel[1]
									$listPixel = $infoListArrPixel[$i]
									;infoPixelDropTroop : First element in array contains troop and list of array to drop troop
									If _Sleep($iDelayLaunchTroop21) Then Return
									SelectDropTroop($infoTroopListArrPixel[0]) ;Select Troop
									If _Sleep($iDelayLaunchTroop23) Then Return
									SetLog("Dropping " & $infoTroopListArrPixel[2] & "  of " & $infoTroopListArrPixel[5] & " => on each side (side : " & $i + 1 & ")", $COLOR_GREEN)
									Local $pixelDropTroop[1] = [$listPixel]
									DropOnPixel($infoTroopListArrPixel[0], $pixelDropTroop, $infoTroopListArrPixel[2], $infoTroopListArrPixel[3])
								EndIf
								If ($isHeroesDropped) Then
									If _sleep (1000) then return ; delay Queen Image  has to be at maximum size : CheckHeroesHealth checks the y = 573
									CheckHeroesHealth()
								EndIf
							Next
						Next
					EndIf
				EndIf
				If _Sleep(SetSleep(1)) Then Return
			Next
		 EndIf

		 if $saveTroops = 1 then
		$endbattle = false
		Local $TimeWaitSaveColl = 5,$timeSC = 0

			;Activate KQ's power
	    If ($checkKPower Or $checkQPower) And $iActivateKQCondition = "Manual" Then
		SetLog("Waiting " & $delayActivateKQ / 1000 & " seconds before activating Hero abilities", $COLOR_BLUE)
		_Sleep($delayActivateKQ)
		$TimeWaitSaveColl =$TimeWaitSaveColl - 2
		If $checkKPower Then
			SetLog("Activating King's power", $COLOR_BLUE)
			SelectDropTroop($King)
			$checkKPower = False
		EndIf
		If $checkQPower Then
			SetLog("Activating Queen's power", $COLOR_BLUE)
			SelectDropTroop($Queen)
			$checkQPower = False
		EndIf

	    EndIf

		For $saveWave = 0 to 2

			$timeSC = 0

			If $saveWave <> 0 Then $TimeWaitSaveColl = 3

			While $timeSC < $TimeWaitSaveColl

			If _Sleep(5000) Then Return
            CheckHeroesHealth()
			$timeSC +=1

			Wend

			If _Sleep(150) Then Return

			Local $contMine = False,$contEli= False

			If $contMine And $contEli Then
		 	SetLog("Checking for remaining gold & elixir collectors...")
			Elseif $contMine Then
			SetLog("Checking for remaining gold collectors...")
			Elseif $contEli Then
			SetLog("Checking for remaining elixir collectors...")
			Endif

			Setlog("Checking for remaining collectors...")

			Local $foundRemainingCollectors = False
		    _WinAPI_DeleteObject($hBitmapFirst)
	    	$hBitmapFirst = _CaptureRegion2()

			Global $PixelMine[0]
			Global $PixelElixir[0]
			Global $PixelDarkElixir[0]
			Global $PixelNearCollector[0]

			; If drop troop near gold mine
			If ($iChkSmartAttack[$iMatchMode][0] = 1) Then
				$PixelMine = GetLocationMine()
				If (IsArray($PixelMine)) Then
					_ArrayAdd($PixelNearCollector, $PixelMine)
					$foundRemainingCollectors = True
				EndIf
			EndIf
			; If drop troop near elixir collector
			If ($iChkSmartAttack[$iMatchMode][1] = 1)  Then
				$PixelElixir = GetLocationElixir()
				If (IsArray($PixelElixir)) Then
					_ArrayAdd($PixelNearCollector, $PixelElixir)
					$foundRemainingCollectors = True
				EndIf
			EndIf
			; If drop troop near dark elixir drill
			If ($iChkSmartAttack[$iMatchMode][2] = 1) Then
				$PixelDarkElixir = GetLocationDarkElixir()
				If (IsArray($PixelDarkElixir)) Then
					_ArrayAdd($PixelNearCollector, $PixelDarkElixir)
					$foundRemainingCollectors = True
				EndIf
			EndIf

			If $foundRemainingCollectors  Then
			SetLog("[" & UBound($PixelMine) & "] Gold Mines")
			SetLog("[" & UBound($PixelElixir) & "] Elixir Collectors")
			SetLog("[" & UBound($PixelDarkElixir) & "] Dark Elixir Drill/s")
			If $saveWave = 2 Then
			SetLog("Continue attacking with remaining troops...")

			Return
	        Else
			SetLog("Continue attacking...")
	        Endif
			Local $TotalArmyNeed = 0 ;required army for remaining collectors, basis 5 bar and 5 arch each
			$TotalArmyNeed=UBound($PixelNearCollector) * 5

			Else
		;	if not $contMine then SetLog("Gold resources below requirement. End battle!...")
			;if not $contEli then SetLog("Elixir resources below requirement. End battle!...")
			If Not $foundRemainingCollectors Then SetLog("No remaining collectors. End battle!...")
			$endbattle = True
			Return
            Endif

	Local $listListInfoDeployTroopPixel[0]

		For $i = 0 To UBound($listInfoDeploy) - 1
			Local $troop = -1
			Local $troopNb = 0
			Local $name = ""
			$troopKind = $listInfoDeploy[$i][0]
			$nbSides = $listInfoDeploy[$i][1]
			$waveNb = $listInfoDeploy[$i][2]
			$maxWaveNb = $listInfoDeploy[$i][3]
			$slotsPerEdge = $listInfoDeploy[$i][4]
			If (IsNumber($troopKind)) Then
				For $j = 0 To UBound($atkTroops) - 1 ; identify the position of this kind of troop
					If $atkTroops[$j][0] = $troopKind Then
						$troop = $j
						$troopNb = Ceiling($atkTroops[$j][1] / $maxWaveNb)
						Local $plural = 0
						If $troopNb > 1 Then $plural = 1
						$name = NameOfTroop($troopKind, $plural)
					EndIf
				Next
			EndIf
			If ($troop <> -1 And $troopNb > 0) Or IsString($troopKind) Then
				Local $listInfoDeployTroopPixel
				If (UBound($listListInfoDeployTroopPixel) < $waveNb) Then
					ReDim $listListInfoDeployTroopPixel[$waveNb]
					Local $newListInfoDeployTroopPixel[0]
					$listListInfoDeployTroopPixel[$waveNb - 1] = $newListInfoDeployTroopPixel
				EndIf
				$listInfoDeployTroopPixel = $listListInfoDeployTroopPixel[$waveNb - 1]

				ReDim $listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) + 1]
				If (IsString($troopKind)) Then
					Local $arrCCorHeroes[1] = [$troopKind]
					$listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) - 1] = $arrCCorHeroes
				Else
					Local $infoDropTroop = DropTroop2($troop, $nbSides, $troopNb, $slotsPerEdge, $name)
					$listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) - 1] = $infoDropTroop
				EndIf
				$listListInfoDeployTroopPixel[$waveNb - 1] = $listInfoDeployTroopPixel
			EndIf
		Next

		For $numWave = 0 To UBound($listListInfoDeployTroopPixel) - 1
			Local $listInfoDeployTroopPixel = $listListInfoDeployTroopPixel[$numWave]
			For $i = 0 To UBound($listInfoDeployTroopPixel) - 1
				Local $infoPixelDropTroop = $listInfoDeployTroopPixel[$i]
				If Not (IsString($infoPixelDropTroop[0]) And ($infoPixelDropTroop[0] = "CC" Or $infoPixelDropTroop[0] = "HEROES")) Then
					Local $numberLeft = ReadTroopQuantity($infoPixelDropTroop[0])
					if $numberLeft - $TotalArmyNeed > 0 and $saveWave <> 2 then
					$numberLeft =$TotalArmyNeed
					Endif
					;SetLog("NumberLeft : " & $numberLeft)
					If ($numberLeft > 0) Then
						If _Sleep(100) Then Return
						SelectDropTroop($infoPixelDropTroop[0]) ;Select Troop
						If _Sleep(300) Then Return
						SetLog("Dropping another " & $numberLeft & "  of " & $infoPixelDropTroop[5], $COLOR_GREEN)

						DropOnPixel($infoPixelDropTroop[0], $infoPixelDropTroop[1], Ceiling($numberLeft / UBound($infoPixelDropTroop[1])), $infoPixelDropTroop[3])
					EndIf
				EndIf
			Next
		Next

	Next

		Else

		For $numWave = 0 To UBound($listListInfoDeployTroopPixel) - 1
			Local $listInfoDeployTroopPixel = $listListInfoDeployTroopPixel[$numWave]
			For $i = 0 To UBound($listInfoDeployTroopPixel) - 1
				Local $infoPixelDropTroop = $listInfoDeployTroopPixel[$i]
				If Not (IsString($infoPixelDropTroop[0]) And ($infoPixelDropTroop[0] = "CC" Or $infoPixelDropTroop[0] = "HEROES")) Then
					Local $numberLeft = ReadTroopQuantity($infoPixelDropTroop[0])
					;SetLog("NumberLeft : " & $numberLeft)
					If ($numberLeft > 0) Then
						If _Sleep($iDelayLaunchTroop21) Then Return
						SelectDropTroop($infoPixelDropTroop[0]) ;Select Troop
						If _Sleep($iDelayLaunchTroop23) Then Return
						SetLog("Dropping last " & $numberLeft & "  of " & $infoPixelDropTroop[5], $COLOR_GREEN)

						DropOnPixel($infoPixelDropTroop[0], $infoPixelDropTroop[1], Ceiling($numberLeft / UBound($infoPixelDropTroop[1])), $infoPixelDropTroop[3])
					EndIf
				EndIf
			Next
		Next
	Else
		For $i = 0 To UBound($listInfoDeploy) - 1
			If (IsString($listInfoDeploy[$i][0]) And ($listInfoDeploy[$i][0] = "CC" Or $listInfoDeploy[$i][0] = "HEROES")) Then
				If $iMatchMode = $LB And $iChkDeploySettings[$LB] >= 4 Then ; Used for DE or TH side attack
					Local $RandomEdge = $Edges[$BuildingEdge]
					Local $RandomXY = 2
				Else
					Local $RandomEdge = $Edges[Round(Random(0, 3))]
					Local $RandomXY = Round(Random(0, 4))
				EndIf
				If ($listInfoDeploy[$i][0] = "CC") Then
					dropCC($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $CC)
				ElseIf ($listInfoDeploy[$i][0] = "HEROES") Then
					dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $King, $Queen,$Warden)
				EndIf
			Else
				If LauchTroop($listInfoDeploy[$i][0], $listInfoDeploy[$i][1], $listInfoDeploy[$i][2], $listInfoDeploy[$i][3], $listInfoDeploy[$i][4]) Then
					If _Sleep(SetSleep(1)) Then Return
				EndIf
			EndIf
		Next
    EndIf
	EndIf
	Return True
EndFunc   ;==>LaunchTroop2
