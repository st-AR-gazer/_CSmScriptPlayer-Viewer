float savedAimYaw = 0.0;

void AimYaw() {
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
    
    float aimYaw = 0.0;
    float aimPitch = 0.0;
    float aimRoll = 0.0;

    if (script !is null) {
        if(script.CurrentRaceTime > -1) {
            aimYaw = script.AimYaw;
            aimPitch = script.AimPitch;
            aimRoll = script.AimRoll;

            savedAimYaw = aimYaw;
            savedAimPitch = aimPitch;
            savedAimRoll = aimRoll;
        }        
    } else {
        aimYaw = savedAimYaw;
        aimPitch = savedAimPitch;
        aimRoll = savedAimRoll;
        // print("Yaw'" + aimYaw + "' - Pitch'" + aimPitch + "'' - Roll'" + aimRoll + "'");
    }

    vec2 sizeYaw = Setting_AimYaw_Size;
    vec2 posYaw = Setting_AimYaw_Pos;
    vec2 screenSize = vec2(Draw::GetWidth(), Draw::GetHeight());
    vec2 origin = posYaw * (screenSize - sizeYaw);

    vec2 center = vec2(origin.x + sizeYaw.x / 2.0, origin.y + sizeYaw.y / 2.0);
    float radius = sizeYaw.x / 2.0;

    // Draw the circle
    nvg::BeginPath();
    nvg::Circle(center, radius);
    nvg::StrokeColor(Setting_General_BorderColor);
    nvg::StrokeWidth(2.0);
    nvg::FillColor(Setting_General_FillColor);
    nvg::Fill();
    nvg::Stroke();

    // Set tick logic
    int numTicks = 7;
    float tickLength = 0.1 * radius;
    float tickStart = -3.14159265359 * 1.5;
    float tickEnd = 3.14159265359 * 0.5;
    float tickIncrement = (tickEnd - tickStart) / (numTicks - 1);
    float tickAngle = tickStart;

    // Draw the tick marks
    if (Setting_General_EnableTickMark) {
        for (int i = 0; i < numTicks; i++) {
            vec2 tickStartPos = center + vec2(radius * Math::Cos(tickAngle), radius * Math::Sin(tickAngle));
            vec2 tickEndPos = tickStartPos + tickLength * vec2(Math::Cos(tickAngle), Math::Sin(tickAngle));
            nvg::BeginPath();
            nvg::MoveTo(tickStartPos);
            nvg::LineTo(tickEndPos);
            nvg::StrokeWidth(1.0);
            nvg::StrokeColor(Setting_General_MarkerColor);
            nvg::Stroke();
            tickAngle += tickIncrement;
        }
    }
    

    // Draw the dial value
    if (Setting_General_EnableOldSettings) {
        if (script !is null) {
        aimYaw = script.AimYaw;
    }
    float valueAngle = (aimYaw - -3.14) / (3.14 - -3.14) * (tickEnd - tickStart) + tickStart;
    vec2 valuePos = center + 0.6 * radius * vec2(Math::Cos(valueAngle), Math::Sin(valueAngle));
    
    nvg::BeginPath();
    nvg::Circle(valuePos, tickLength * 0.7);
    nvg::FillColor(Setting_General_FillColor);
    nvg::Fill();
    nvg::ClosePath();
    } else {
        float valueAngle = (aimYaw - -3.14) / (3.14 - -3.14) * (tickEnd - tickStart) + tickStart;
        vec2 valuePos = center + radius * vec2(Math::Cos(valueAngle), Math::Sin(valueAngle));
        nvg::BeginPath();
        nvg::MoveTo(center);
        nvg::LineTo(valuePos);
        nvg::StrokeColor(Setting_General_MarkerColor);
        nvg::StrokeWidth(2.0);
        nvg::Stroke();
        nvg::ClosePath();
    }
    

    // Draw "Yaw" in the center
    nvg::BeginPath();
    nvg::FontSize(18.0);
    nvg::FillColor(Setting_General_TextColor);
    nvg::TextAlign(nvg::Align::Center | nvg::Align::Middle);
    nvg::Text(center, "Yaw");
    nvg::ClosePath();

}



