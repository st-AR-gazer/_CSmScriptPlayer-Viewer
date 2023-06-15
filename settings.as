[Setting category="General" name="Select player Override"]
bool Player_Viewing_Override = false;
[Setting category="General" name="Select player"]
double Override_Player_Viewing = 0;

[Setting category="General" name="Enable Tick Maks"]
bool Setting_General_EnableTickMark = false;

[Setting category="General" name="Render all CSmScriptPlayer Info"]
bool Show_All_CSmScriptPlayer_Info = true;

[Setting category="General" name="Enable Old Settings"]
bool Setting_General_EnableOldSettings = false;

[Setting category="General" name="Dial Snapshot Mode"]
bool Setting_Dial_Snapshot_Mode = false;


//Yaw
[Setting category="Size/Pos" name="Size (Yaw)"]
float Setting_AimYaw_Size = 120;

[Setting category="Size/Pos" name="Position (Yaw)"]
vec2 Setting_AimYaw_Pos = vec2(0.994f, 0.590f);

//Pitch
[Setting category="Size/Pos" name="Size (Pitch)"]
float Setting_AimPitch_Size = 120;

[Setting category="Size/Pos" name="Position (Pitch)"]
vec2 Setting_AimPitch_Pos = vec2(0.994f, 0.440f);

//Roll
[Setting category="Size/Pos" name="Size (Roll)"]
float Setting_AimRoll_Size = 120;

[Setting category="Size/Pos" name="Position (Roll)"]
vec2 Setting_AimRoll_Pos = vec2(0.994f, 0.290f);



[Setting category="Colour" name="Border color" color]
vec4 Setting_General_BorderColor = vec4(1, 1, 1, 1);
vec4 borderColor = Setting_General_EnableOldSettings ? vec4(1, 1, 1, 1) : Setting_General_BorderColor;

[Setting category="Colour" name="Fill color" color]
vec4 Setting_General_FillColor = vec4(0, 0, 0, 0.7);
vec4 fillColor = Setting_General_EnableOldSettings ? vec4(0, 0, 0, 0.7) : Setting_General_FillColor;

[Setting category="Colour" name="Marker color" color]
vec4 Setting_General_MarkerColor = vec4(1, 0, 0, 1);
vec4 markerColor = Setting_General_EnableOldSettings ? vec4(1, 0, 0, 1) : Setting_General_MarkerColor;

[Setting category="Colour" name="Text color" color]
vec4 Setting_General_TextColor = vec4(255, 255, 255, 1);
vec4 textColor = Setting_General_EnableOldSettings ? vec4(255, 255, 255, 1) : Setting_General_TextColor;

