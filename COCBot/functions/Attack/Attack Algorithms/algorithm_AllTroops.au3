; #FUNCTION# ====================================================================================================================
; Name ..........: algorith_AllTroops
; Description ...: This file contens all functions to attack algorithm will all Troops , using Barbarians, Archers, Goblins, Giants and Wallbreakers as they are available
; Syntax ........: algorithm_AllTroops()
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......: LunaEclipse (Jan-2016)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func getHeroes() ;Get information about your heroes
	; $debugSetlog = 1
	Local $aDeployButtonPositions = getUnitLocationArray()
	; $debugSetlog = 0

	$King = $aDeployButtonPositions[$eKing]
    $Queen = $aDeployButtonPositions[$eQueen]
    $Warden = $aDeployButtonPositions[$eWarden]
    $CC = $aDeployButtonPositions[$eCastle]

    If $debugSetlog=1 Then
        SetLog("Use king  SLOT n° " & $King, $COLOR_PURPLE)
        SetLog("Use queen SLOT n° " & $Queen, $COLOR_PURPLE)
        SetLog("Use Warden SLOT n° " & $Warden, $COLOR_PURPLE)
        SetLog("Use CC SLOT n° " & $CC, $COLOR_PURPLE)
    EndIf
EndFunc

Func useHeroesAbility() ;Use the heroes abilities if appropriate
    ;Activate KQ's power
    If ($checkKPower Or $checkQPower) And $iActivateKQCondition = "Manual" Then
        SetLog("Waiting " & $delayActivateKQ / 1000 & " seconds before activating Hero abilities", $COLOR_BLUE)

        If _Sleep($delayActivateKQ) Then Return

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
EndFunc

Func useTownHallSnipe() ;End battle after a town hall snipe
    SwitchAttackTHType()

    If $zoomedin = True Then
        ZoomOut()
        $zoomedin = False
        $zCount = 0
        $sCount = 0
    EndIf

    ;If $OptTrophyMode = 1 And SearchTownHallLoc() Then Return ;Exit attacking if trophy hunting and not bullymode

    If ($THusedKing = 0 and $THusedQueen=0) Then
        Setlog("Wait few sec before close attack")
        If _Sleep(random(2,5,1)*1000) Then Return ;wait 2-5 second before exit if king and queen are not dropped
    Else
        SetLog("King and/or Queen dropped, close attack")
    EndIf

    ;close battle
    For $i = 1 To 30
        ;_CaptureRegion()
        If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then ExitLoop ;exit if not 'no star'
        If _Sleep($iDelayalgorithm_AllTroops2) Then Return
    Next

    If IsAttackPage() Then ClickP($aSurrenderButton, 1, 0, "#0030") ;Click Surrender
    If _Sleep($iDelayalgorithm_AllTroops3) Then Return
	If IsEndBattlePage() Then
        ClickP($aConfirmSurrender, 1, 0, "#0031") ;Click Confirm
        If _Sleep($iDelayalgorithm_AllTroops1) Then Return
    EndIf
EndFunc

Func useSmartDeploy() ;Gets infomation about the red area for Smart Deploy
    SetLog("Calculating Smart Attack Strategy", $COLOR_BLUE)

    Local $hTimer = TimerInit()
    _WinAPI_DeleteObject($hBitmapFirst)
    $hBitmapFirst = _CaptureRegion2()
    _GetRedArea()

    SetLog("Calculated  (in " & Round(TimerDiff($hTimer) / 1000, 2) & " seconds) :")
    ;SetLog("    [" & UBound($PixelTopLeft) & "] pixels TopLeft")
    ;SetLog("    [" & UBound($PixelTopRight) & "] pixels TopRight")
    ;SetLog("    [" & UBound($PixelBottomLeft) & "] pixels BottomLeft")
    ;SetLog("    [" & UBound($PixelBottomRight) & "] pixels BottomRight")

    If ($iChkSmartAttack[$iMatchMode][0] = 1 Or $iChkSmartAttack[$iMatchMode][1] = 1 Or $iChkSmartAttack[$iMatchMode][2] = 1) Then
        SetLog("Locating Mines, Collectors & Drills", $COLOR_BLUE)

        $hTimer = TimerInit()

        Global $PixelMine[0]
        Global $PixelElixir[0]
        Global $PixelDarkElixir[0]
        Global $PixelNearCollector[0]

        ; If drop troop near gold mine
        If ($iChkSmartAttack[$iMatchMode][0] = 1) Then
            $PixelMine = GetLocationMine()
            If (IsArray($PixelMine)) Then
                _ArrayAdd($PixelNearCollector, $PixelMine)
            EndIf
        EndIf

        ; If drop troop near elixir collector
        If ($iChkSmartAttack[$iMatchMode][1] = 1) Then
            $PixelElixir = GetLocationElixir()
            If (IsArray($PixelElixir)) Then
                _ArrayAdd($PixelNearCollector, $PixelElixir)
            EndIf
        EndIf

        ; If drop troop near dark elixir drill
        If ($iChkSmartAttack[$iMatchMode][2] = 1) Then
            $PixelDarkElixir = GetLocationDarkElixir()
            If (IsArray($PixelDarkElixir)) Then
                _ArrayAdd($PixelNearCollector, $PixelDarkElixir)
            EndIf
        EndIf

        SetLog("Located  (in " & Round(TimerDiff($hTimer) / 1000, 2) & " seconds) :")
        SetLog("[" & UBound($PixelMine) & "] Gold Mines")
        SetLog("[" & UBound($PixelElixir) & "] Elixir Collectors")
        SetLog("[" & UBound($PixelDarkElixir) & "] Dark Elixir Drill/s")

        $iNbrOfDetectedMines[$iMatchMode] += UBound($PixelMine)
        $iNbrOfDetectedCollectors[$iMatchMode] += UBound($PixelElixir)
        $iNbrOfDetectedDrills[$iMatchMode] += UBound($PixelDarkElixir)

        UpdateStats()
    EndIf
EndFunc

Func getNumberOfSides() ;Returns the number of sides to attack from
    Local $nbSides = 0

    Switch $iChkDeploySettings[$iMatchMode]
        Case $eOneSide ;Single sides ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            SetLog("Attacking on a single side", $COLOR_BLUE)
            $nbSides = 1
        Case $eTwoSides ;Two sides ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            SetLog("Attacking on two sides", $COLOR_BLUE)
            $nbSides = 2
        Case $eThreeSides ;Three sides ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            SetLog("Attacking on three sides", $COLOR_BLUE)
            $nbSides = 3
        Case $eAllSides ;All sides ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            SetLog("Attacking on all sides", $COLOR_BLUE)
            $nbSides = 4
	    Case $eSmartSave ;Save Troops Style ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			SetLog("Attacking with save troops for collectors", $COLOR_BLUE)
			$nbSides = 4
			$saveTroops = 1
        Case $eFourFinger ;Four Finger ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            SetLog("Attacking four finger fight style", $COLOR_BLUE)
            $nbSides = 5
        Case $eDESide ;DE Side - Live Base only ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            SetLog("Attacking on Dark Elixir Side.", $COLOR_BLUE)
			$nbSides = 1
        Case $eTHSide ;TH Side - Live Base only ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            SetLog("Attacking on Town Hall Side.", $COLOR_BLUE)
            $nbSides = 1
    EndSwitch

    Return $nbSides
EndFunc

Func getDeploymentInfo($nbSides) ;Returns the Deployment array for LaunchTroops
    ; $ListInfoDeploy = [Troop, No. of Sides, $WaveNb, $MaxWaveNb, $slotsPerEdge]
    If $iMatchMode = $LB And ($iChkDeploySettings[$LB] = $eDESide Or $iChkDeploySettings[$LB] = $eTHSide) Then ; Customized side wave deployment here for DE and TH side
        If $debugSetlog = 1 Then SetLog("List Deploy for Customized Side attack", $COLOR_PURPLE)

        Local $listInfoDeploy[24][5]
        Local $waveCount, $waveNumber
        Local $deploystring

        for $i = 0 to 23
            $listInfoDeploy[$i][0] = String($DeDeployType[$i])
            $listInfoDeploy[$i][1] = $nbSides
			$waveCount = 0
            $waveNumber = 0
            for $j = 0 to 23
               If string($DeDeployType[$i]) = string($DeDeployType[$j]) Then
                  $waveCount = $waveCount + 1
                  If $j <= $i Then
                     $waveNumber = $waveNumber + 1
                  EndIf
               EndIf
            Next
            $listInfoDeploy[$i][2] = $waveNumber
            $listInfoDeploy[$i][3] = $waveCount
            $listInfoDeploy[$i][4] = $DeDeployPosition[$i]
        Next
    ElseIf $iChkDeploySettings[$iMatchMode] = $eFourFinger Then ;Four Finger deployment
        If $debugSetlog = 1 Then SetLog("ListDeploy for Four Finger attack", $COLOR_PURPLE)

        Local $listInfoDeploy[11][5] = [[$eGiant, $nbSides, 1, 1, 2] _
            , [$eBarb, $nbSides, 1, 1, 0] _
            , [$eArch, $nbSides, 1, 1, 0] _
            , [$eWall, $nbSides, 1, 1, 2] _
            , [$eGobl, $nbSides, 1, 2, 0] _
            , ["CC", 1, 1, 1, 1] _
            , [$eHogs, $nbSides, 1, 1, 2] _
            , [$eWiza, $nbSides, 1, 1, 0] _
            , [$eMini, $nbSides, 1, 1, 0] _
            , [$eGobl, $nbSides, 2, 2, 0] _
            , ["HEROES", 1, 2, 1, 1] _
		]
    ElseIf $saveTroops = 1 Then ; Save Troops Style
        If $debugSetlog = 1 Then SetLog("List Deploy for Save Troops attacks", $COLOR_PURPLE)

	    Local $listInfoDeploy[11][5] = [[$eGiant, $nbSides, 1, 1, 2] _
			, [$eBarb, $nbSides, 1, 2, 0] _
			, [$eWall, $nbSides, 1, 1, 1] _
			, [$eArch, $nbSides, 1, 2, 0] _
			, [$eGobl, $nbSides, 1, 2, 0] _
			, ["CC", 1, 1, 1, 1] _
			, [$eHogs, $nbSides, 1, 1, 1] _
			, [$eWiza, $nbSides, 1, 1, 0] _
			, [$eMini, $nbSides, 1, 2, 0] _
			, [$eGobl, $nbSides, 2, 2, 0] _
			, ["HEROES", 1, 2, 1, 1] _
		]
   Else
        If $debugSetlog = 1 Then SetLog("List Deploy for Standard attacks", $COLOR_PURPLE)

        Local $listInfoDeploy[13][5] = [[$eGiant, $nbSides, 1, 1, 2] _
            , [$eBarb, $nbSides, 1, 2, 0] _
            , [$eWall, $nbSides, 1, 1, 1] _
            , [$eArch, $nbSides, 1, 2, 0] _
            , [$eBarb, $nbSides, 2, 2, 0] _
            , [$eGobl, $nbSides, 1, 2, 0] _
            , ["CC", 1, 1, 1, 1] _
            , [$eHogs, $nbSides, 1, 1, 1] _
            , [$eWiza, $nbSides, 1, 1, 0] _
            , [$eMini, $nbSides, 1, 1, 0] _
            , [$eArch, $nbSides, 2, 2, 0] _
            , [$eGobl, $nbSides, 2, 2, 0] _
            , ["HEROES", 1, 2, 1, 1] _
		]
    EndIf

    Return $listInfoDeploy
EndFunc

Func dropRemainingTroops($nbSides) ;Uses any left over troops
    SetLog("Dropping left over troops", $COLOR_BLUE)

    For $x = 0 To 1
        PrepareAttack($iMatchMode, True) ;Check remaining quantities
        For $i = $eBarb To $eLava ; lauch all remaining troops
            ;If $i = $eBarb Or $i = $eArch Then
            LaunchTroops($i, $nbSides, 0, 1)
            CheckHeroesHealth()
            ;Else
            ;     LaunchTroops($i, $nbSides, 0, 1, 2)
            ;EndIf
            If _Sleep($iDelayalgorithm_AllTroops5) Then Return
        Next
    Next
EndFunc

Func deployTroops($nbSides) ;This function is the branch point to new deployments in different files
    ; $ListInfoDeploy = [Troop, No. of Sides, $WaveNb, $MaxWaveNb, $slotsPerEdge]
    Local $listInfoDeploy = getDeploymentInfo($nbSides)

    Switch $iChkDeploySettings[$iMatchMode]
		Case $eSmartSave
			LaunchSaveTroops($listInfoDeploy, $CC, $King, $Queen, $Warden)
		Case $eFourFinger
			LaunchFourFinger($listInfoDeploy, $CC, $King, $Queen, $Warden)
		Case $eDESide, $eTHSide
			LaunchSideAttack($listInfoDeploy, $CC, $King, $Queen, $Warden)
		Case Else
			LaunchStandard($listInfoDeploy, $CC, $King, $Queen, $Warden)
	EndSwitch
EndFunc

Func algorithm_AllTroops() ;Attack Algorithm for all existing troops
    If $debugSetlog=1 Then Setlog("algorithm_AllTroops",$COLOR_PURPLE)

    getHeroes()

    If _Sleep($iDelayalgorithm_AllTroops1) Then Return

    If $iMatchMode = $TS  Then
        useTownHallSnipe()
        Return
    EndIf

    Local $nbSides = getNumberOfSides()

    If $nbSides = 0 Then Return; No sides set, so lets just quit

    If ($iChkRedArea[$iMatchMode]) And $iChkDeploySettings[$iMatchMode] < 5 Then
        useSmartDeploy()
    ElseIf NOT $iChkRedArea[$iMatchMode] And $iChkDeploySettings[$iMatchMode] = 6 Then ;DE Side - Live Base only ~~~~~~~~~~~~~~~~
        GetBuildingEdge($eSideBuildingDES) ; Get DE Storage side when Redline is not used.
    ElseIf NOT $iChkRedArea[$iMatchMode] And $iChkDeploySettings[$iMatchMode] = 7 Then ;TH Side - Live Base only ~~~~~~~~~~~~~~~~
        GetBuildingEdge($eSideBuildingTH) ; Get Townhall side when Redline is not used.
    EndIf

    If _Sleep($iDelayalgorithm_AllTroops2) Then Return

    deployTroops($nbSides)

    If _Sleep($iDelayalgorithm_AllTroops4) Then Return

    dropRemainingTroops($nbSides) ;Use remaining troops
    useHeroesAbility() ;Use heroes abilities

    SetLog("Finished Attacking, waiting for the battle to end")
EndFunc   ;==>algorithm_AllTroops