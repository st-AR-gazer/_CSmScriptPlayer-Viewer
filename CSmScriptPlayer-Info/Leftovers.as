void Leftover() {
    CTrackMania@ app = cast<CTrackMania>(GetApp());
    auto playground = cast<CSmArenaClient>(app.CurrentPlayground);
    CSmScriptPlayer@ script = null;
    int Player_Viewing = 0;
    
    for (int i = 0; i < playground.Arena.Players.Length; i++) {
        CSmScriptPlayer@ currentScript = cast<CSmScriptPlayer>(playground.Arena.Players[i].ScriptAPI);
        if (currentScript != null && currentScript.AimYaw != 0.0 && currentScript.AimPitch != 0.0 && currentScript.AimRoll != 0.0) {
            @script = @currentScript;
            Player_Viewing = i;  
            break;
        }
    }

    int startTime = 0;
    //
    //
    //
    //
    uint currentLapNumber = 0;
    int currentRaceTime = 0;
    int currentLapTime = 0;
    int lapStartTime = 0;
    // EPost::CarDriver ??
    bool autoSwitchWeapon = false;
    uint curWeapon = 0;
    uint curAmmo = 0;
    uint curAmmoMax = 0;

    int actionWheelSelectedSlotIndex = 65535;
    int armor = 500;
    int armorMax = 500;
    int armorGain = 25;
    int armorReplenishGain = 0;
    float armorPower = 0; //slider 0.1 -- 10

    uint staminaMaxValue = 0;

    float staminaMax = 1; //slider 0.1 -- 3
    float staminaGain = 1; //slider 0 -- 1
    float staminaPower = 1; //slider 0.1 -- 1
    float energy = 0; //dragable content in box, can select any value
    float speedPower = 1; //slider 0.1 -- 1
    float jumpPower = 1; //slider 0.1 -- 1

    bool allowWallJump = true;
    bool allowProgressiveJump = true;
    bool useAlternateWeaponVisual = false;
    bool isHighlighted = true;

    float energyLevel = 1; //slider 0 -- 1

    vec3 forceColor = vec3(0, 0, 0); //write 0 -- 1

    string dossard = ""; //the placement numbers and the trigram text
    string dossard_Number = ""; //the placement numbers
    string dossard_Trigram = ""; //the trigram
    // link these to the cerrect place
    float x1 = 1;
    float y1 = 1;
    float z1 = 1;
    vec3 dossard_Color = vec3(x1, y1, z1); //these can be changed, make it so that it can be changed in the UI:: menu that is opned

    float getLinearHue = 0.1666667;
    float forceLinearHue = 0.167;
    MwId forceModelId = 0xffffffff;
    bool hasShield = false;
    bool isInVehicle = false;
    bool isStuck = false;

    float throwSpeed = 1; //slider 0 -- 500
    int currentClan = 0;
    uint idleDuration = 60;
    bool isEntityStateAvailable = true;

    float x2 = 1;
    float y2 = 1;
    float z2 = 1;
    vec3 position = vec3(x2, y2, z2); //these cannot be changed, make sure to direct correctly

    float x3 = 1;
    float y3 = 1;
    float z3 = 1;
    float aimYaw = x3;
    float aimPitch = y3;
    float aimRoll = z3;

    float x4 = 1;
    float y4 = 1;
    float z4 = 1;
    vec3 aimDirection = vec3(x4, y4, z4);

    float x5 = 1;
    float y5 = 1;
    float z5 = 1;
    vec3 upDirection = vec3(x5, y5, z5);

    float x6 = 1;
    float y6 = 1;
    float z6 = 1;
    vec3 leftDirection = vec3(x6, y6, z6);

    float x7 = 1;
    float y7 = 1;
    float z7 = 1;
    vec3 velocity = vec3(x7, y7, z7);

    float x8 = 1;
    float speed = x8;

    bool isUnderground = false;
    bool isTouchingGround = false;
    bool isInAir = false;
    bool isInWater = false;
    bool isInOffZone = false;
    bool isOnTech = false;
    bool isOnTechGround = false;
    bool isOnTechLaser = false;
    bool isOnTechArrow = false;
    bool isOnTechNucleus = false;
    bool isOnTechArmor = false;
    bool isOnTechSafeZone = false;
    bool isOnTechTeleport = false;
    bool isOnTechNoWeapon = false;
    bool isPowerJumpActivable = false;
    bool isTeleportActivable = false;
    bool isAttractorActivable = false;
    uint nbActiveAttractors = 0;
    bool isRunning = false;
    bool isCapturing = false;

    // Nod Says that "CSmObject" contains nothing...

    bool isFakePlayer = false;
    bool isBot = false;
    bool useDelayedVisuals = false;
    bool useCrudeExtrapolation = false;
    bool trustClientSimu = false;

    float accelCoef = 1; //range 0-1
    float controlCoef = 1; //range 0-1
    float gravityCoef = 1; //range 0-1
    float adherenceCoef = 1; //range 0-1
    float upwardness = 1; //Might prove usefull for the setup? //look into this further...
    float distance = 0;
    uint displaySpeed = 0;
    float inputSteer = 0;
    float inputGasPedal = 0; //Why isn't this a bool?
    bool inputIsBraking = false; //? Bruh, this is a bool :xdd:

    float x9 = 0;
    float engineRpm = x9;

    int engineCurGear = 1;
    float engineTurboRatio = 0;

    uint x10 = 4;
    uint wheelsContactCount = x10;

    uint wheelsSkiddingCount = 0;
    uint flyingDuration = 0;
    uint skiddingDuration = 0;
    float skiddingDistance = 0;
    float flyingDistance = 0;
    uint handicapNoGasDuration = 0;
    uint handicapForceGasDuration = 0;
    uint handicapNoBrakesDuration = 0;
    uint handicapNoSteeringDuration = 0;
    uint handicapNoGripDuration = 0;


    if (script !is null) {
        startTime = script.StartTime;
        currentLapNumber = script.CurrentLapNumber;
        currentRaceTime = script.CurrentRaceTime;
        currentLapTime = script.CurrentLapTime;
        lapStartTime = script.LapStartTime;
        autoSwitchWeapon = script.AutoSwitchWeapon;
        curWeapon = script.CurWeapon;
        curAmmo = script.CurAmmo;
        curAmmoMax = script.CurAmmoMax;
        actionWheelSelectedSlotIndex = script.ActionWheelSelectedSlotIndex;
        armor = script.Armor;
        armorMax = script.ArmorMax;
        armorGain = script.ArmorGain;
        armorReplenishGain = script.ArmorReplenishGain;
        armorPower = script.ArmorPower;
        staminaMaxValue = script.StaminaMaxValue;
        staminaMax = script.StaminaMax;
        staminaGain = script.StaminaGain;
        staminaPower = script.StaminaPower;
        energy = script.Energy;
        speedPower = script.SpeedPower;
        jumpPower = script.JumpPower;
        allowWallJump = script.AllowWallJump;
        allowProgressiveJump = script.AllowProgressiveJump;
        useAlternateWeaponVisual = script.UseAlternateWeaponVisual;
        isHighlighted = script.IsHighlighted;
        energyLevel = script.EnergyLevel;
        forceColor = script.ForceColor;
        dossard = script.Dossard;
        dossard_Number = script.Dossard_Number;
        dossard_Trigram = script.Dossard_Trigram;
        dossard_Color = script.Dossard_Color;
        getLinearHue = script.GetLinearHue;
        forceLinearHue = script.ForceLinearHue;
        forceModelId = script.ForceModelId;
        hasShield = script.HasShield;
        isInVehicle = script.IsInVehicle;
        isStuck = script.IsStuck;
        throwSpeed = script.ThrowSpeed;
        currentClan = script.CurrentClan;
        idleDuration = script.IdleDuration;
        isEntityStateAvailable = script.IsEntityStateAvailable;
        position = script.Position;
        aimYaw = script.AimYaw;
        aimPitch = script.AimPitch;
        aimRoll = script.AimRoll;
        aimDirection = script.AimDirection;
        upDirection = script.UpDirection;
        leftDirection = script.LeftDirection;
        velocity = script.Velocity;
        speed = script.Speed;
        isUnderground = script.IsUnderground;
        isTouchingGround = script.IsTouchingGround;
        isInAir = script.IsInAir;
        isInWater = script.IsInWater;
        isInOffZone = script.IsInOffZone;
        isOnTech = script.IsOnTech;
        isOnTechGround = script.IsOnTechGround;
        isOnTechLaser = script.IsOnTechLaser;
        isOnTechArrow = script.IsOnTechArrow;
        isOnTechNucleus = script.IsOnTechNucleus;
        isOnTechArmor = script.IsOnTechArmor;
        isOnTechSafeZone = script.IsOnTechSafeZone;
        isOnTechTeleport = script.IsOnTechTeleport;
        isOnTechNoWeapon = script.IsOnTechNoWeapon;
        isPowerJumpActivable = script.IsPowerJumpActivable;
        isTeleportActivable = script.IsTeleportActivable;
        isAttractorActivable = script.IsAttractorActivable;
        nbActiveAttractors = script.NbActiveAttractors;
        isRunning = script.IsRunning;
        isCapturing = script.IsCapturing;
        isFakePlayer = script.IsFakePlayer;
        isBot = script.IsBot;
        useDelayedVisuals = script.UseDelayedVisuals;
        useCrudeExtrapolation = script.UseCrudeExtrapolation;
        trustClientSimu = script.TrustClientSimu;
        accelCoef = script.AccelCoef;
        controlCoef = script.ControlCoef;
        gravityCoef = script.GravityCoef;
        adherenceCoef = script.AdherenceCoef;
        upwardness = script.Upwardness;
        distance = script.Distance;
        displaySpeed = script.DisplaySpeed;
        inputSteer = script.InputSteer;
        inputGasPedal = script.InputGasPedal;
        inputIsBraking = script.InputIsBraking;
        engineRpm = script.EngineRpm;
        engineCurGear = script.EngineCurGear;
        engineTurboRatio = script.EngineTurboRatio;
        wheelsContactCount = script.WheelsContactCount;
        wheelsSkiddingCount = script.WheelsSkiddingCount;
        flyingDuration = script.FlyingDuration;
        skiddingDuration = script.SkiddingDuration;
        flyingDistance = script.FlyingDistance;
        handicapNoGasDuration = script.HandicapNoGasDuration;
        handicapForceGasDuration = script.HandicapForceGasDuration;
        handicapNoBrakesDuration = script.HandicapNoBrakesDuration;
        handicapNoSteeringDuration = script.HandicapNoSteeringDuration;
        handicapNoGripDuration = script.HandicapNoGripDuration;
    }

    if (Show_All_CSmScriptPlayer_Info) {
        int windowFlags = UI::WindowFlags::AlwaysAutoResize |
                            UI::WindowFlags::NoCollapse |
                            UI::WindowFlags::NoDocking |
                            UI::WindowFlags::NoTitleBar;
        if (!UI::IsOverlayShown()) windowFlags |= UI::WindowFlags::NoInputs;

        const string WHITE  = "\\$FFF";

        UI::Begin("CurrentEffects", windowFlags);
        UI::Text(  
            Icons::HourglassStart + "  " + startTime + " Start Time" + WHITE +
            "\n" + Icons::Kenney::Checkbox + "  " + currentLapNumber + " Current Lap Number" + WHITE +
            "\n" + Icons::Cog + "  " + currentRaceTime + " Current Race Time" + WHITE +
            "\n" + Icons::ClockO + "  " + currentLapTime + " Current Lap Time" + WHITE +
            "\n" + Icons::ClockO + "  " + lapStartTime + " Lap Start Time" + WHITE +
            "\n" + Icons::Exchange + "  " + autoSwitchWeapon + " Auto Switch Weapon" + WHITE +
            "\n" + Icons::Kenney::PaintBrush + "  " + curWeapon + " Current Weapon" + WHITE +
            "\n" + Icons::Bullseye + "  " + curAmmo + " Current Ammo" + WHITE +
            "\n" + Icons::Archive + "  " + curAmmoMax + " Maximum Ammo" + WHITE +
            "\n" + Icons::DotCircleO + "  " + actionWheelSelectedSlotIndex + " Selected Slot Index" + WHITE +
            "\n" + Icons::Shield + "  " + armor + " Armor" + WHITE +
            "\n" + Icons::Shield + "  " + armorMax + " Maximum Armor" + WHITE +
            "\n" + Icons::PlusCircle + "  " + armorGain + 	" Armor Gain" + WHITE +
            "\n" + Icons::Kenney::Heart + "  " + armorReplenishGain + " Armor Replenish Gain" + WHITE +
            "\n" + Icons::Superpowers + "  " + armorPower + " Armor Power" + WHITE +
            "\n" + Icons::BatteryFull + "  " + staminaMaxValue + " Maximum Stamina Value" + WHITE +
            "\n" + Icons::BatteryFull + "  " + staminaMax + " Maximum Stamina" + WHITE +
            "\n" + Icons::BatteryThreeQuarters + "  " + staminaGain + " Stamina Gain" + WHITE +
            "\n" + Icons::Superpowers + "  " + staminaPower + " Stamina Power" + WHITE +
            "\n" + Icons::Bolt + "  " + energy + " Energy" + WHITE +
            "\n" + Icons::Motorcycle + "  " + speedPower + " Speed Power" + WHITE +
            "\n" + Icons::Kenney::Star + "  " + jumpPower + " Jump Power" + WHITE +
            "\n" + Icons::LongArrowUp + "  " + allowWallJump + " Allow Wall Jump" + WHITE +
            "\n" + Icons::LongArrowUp + "  " + allowProgressiveJump + " Allow Progressive Jump" + WHITE +
            "\n" + Icons::SunO + "  " + useAlternateWeaponVisual + " Use Alternate Weapon Visual" + WHITE +
            "\n" + Icons::UnlockAlt + "  " + isHighlighted + " Is Highlighted" + WHITE +
            "\n" + Icons::LevelUp + "  " + energyLevel + " Energy Level" + WHITE +
            //string+vec3 "\n" + Icons::Terminal + "  " + forceColor + " Force Color" + WHITE +
            "\n" + Icons::Square + "  " + dossard + " Dossard" + WHITE +
            "\n" + Icons::Square + "  " + dossard_Number + " Dossard Number" + WHITE +
            "\n" + Icons::Square + "  " + dossard_Trigram + " Dossard Trigram" + WHITE +
            //string+vec3 "\n" + Icons::Square + "  " + dossard_Color + " Dossard Color" + WHITE +
            "\n" + Icons::Bars + "  " + getLinearHue + " Get Linear Hue" + WHITE +
            "\n" + Icons::Bars + "  " + forceLinearHue + " Force Linear Hue" + WHITE +
            //string+MwId "\n" + Icons::Bars+ "  " + forceModelId + " Force Model ID" + WHITE +
            "\n" + Icons::Shield + "  " + hasShield + " Has Shield" + WHITE +
            "\n" + Icons::Kenney::Car + "  " + isInVehicle + " Is In Vehicle" + WHITE +
            "\n" + Icons::Times + "  " + isStuck + " Is Stuck" + WHITE +
            "\n" + Icons::Bolt + "  " + throwSpeed + " Throw Speed" + WHITE +
            "\n" + Icons::Globe + "  " + currentClan + " Current Clan" + WHITE +
            "\n" + Icons::BookmarkO + "  " + idleDuration + " Idle Duration" + WHITE +
            "\n" + Icons::Check + "  " + isEntityStateAvailable + " Is Entity State Available" + WHITE +
            //string+vec3 "\n" + Icons::LocationArrow + "  " + position + " Position" + WHITE +
            "\n" + Icons::Repeat + "  " + aimYaw + " Aim Yaw" + WHITE +
            "\n" + Icons::Refresh + "  " + aimPitch + " Aim Pitch" + WHITE +
            "\n" + Icons::Refresh + "  " + aimRoll + " Aim Roll" + WHITE +
            //string+vec3 "\n" + Icons::Undo + "  " + aimDirection + " Aim Direction" + WHITE +
            //string+vec3 "\n" + Icons::AngleDoubleUp + "  " + upDirection + " Up Direction" + WHITE +
            //string+vec3 "\n" + Icons::AngleDoubleLeft + "  " + leftDirection + " Left Direction" + WHITE +
            //string+vec3 "\n" + Icons::Tachometer + "  " + velocity + " Velocity" + WHITE +
            "\n" + Icons::Tachometer + "  " + speed + " Speed" + WHITE +
            "\n" + Icons::AngleDoubleDown + "  " + isUnderground + " Is Underground" + WHITE +
            "\n" + Icons::AngleDown + "  " + isTouchingGround + " Is Touching Ground" + WHITE +
            "\n" + Icons::AngleUp + "  " + isInAir + " Is In Air" + WHITE +
            "\n" + Icons::LevelDown + "  " + isInWater + " Is In Water" + WHITE +
            "\n" + Icons::SquareO + "  " + isInOffZone + " Is In Off Zone" + WHITE +
            "\n" + Icons::AngleDown + "  " + isOnTech + " Is On Tech" + WHITE +
            "\n" + Icons::AngleDoubleDown + "  " + isOnTechGround + " Is On Tech Ground" + WHITE +
            "\n" + Icons::WindowMinimize + "  " + isOnTechLaser + " Is On Tech Laser" + WHITE +
            "\n" + Icons::Expand + "  " + isOnTechArrow + " Is On Tech Arrow" + WHITE +
            "\n" + Icons::CircleO + "  " + isOnTechNucleus + " Is On Tech Nucleus" + WHITE +
            "\n" + Icons::Shield + "  " + isOnTechArmor + " Is On Tech Armor" + WHITE +
            "\n" + Icons::Square + "  " + isOnTechSafeZone + " Is On Tech Safe Zone" + WHITE +
            "\n" + Icons::Cloud + "  " + isOnTechTeleport + " Is On Tech Teleport" + WHITE +
            "\n" + Icons::Scissors + "  " + isOnTechNoWeapon + " Is On Tech No Weapon" + WHITE +
            "\n" + Icons::Bolt + "  " + isPowerJumpActivable + " Is Power Jump Activable" + WHITE +
            "\n" + Icons::Cloud + "  " + isTeleportActivable + " Is Teleport Activable" + WHITE +
            "\n" + Icons::Kenney::Minus + "  " + isAttractorActivable + " Is Attractor Activable" + WHITE +
            "\n" + Icons::ThLarge + "  " + nbActiveAttractors + " Number of Active Attractors" + WHITE +
            "\n" + Icons::Bolt + "  " + isRunning + " Is Running" + WHITE +
            "\n" + Icons::SquareO + "  " + isCapturing + " Is Capturing" + WHITE +
            "\n" + Icons::Lock + "  " + isFakePlayer + " Is Fake Player" + WHITE
        );
        UI::End();
    }
    

 
}