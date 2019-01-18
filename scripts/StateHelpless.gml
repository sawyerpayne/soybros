/// StateHelpless()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sHelpless;
image_speed = 0;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.helpless;

// Return to idle state
if (onGround)               nextState = states.idle;



// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Left input
if (kLeft) {
    //if (Smash(pHorizontal, kHorizontal)) facing = -1;
    if (vx > -airSpeed) vx = Approach(vx, -airSpeed, baseAirAccel + Normalize(abs(kHorizontal)) * scaleAirAccel);  
}

// Right input
else if (kRight) {
    //if (Smash(pHorizontal, kHorizontal)) facing = 1;  
    if (vx < airSpeed) vx = Approach(vx, airSpeed, baseAirAccel + Normalize(abs(kHorizontal)) * scaleAirAccel);  
}

// No left or right inputs
else vx = Approach(vx, 0, airFriction);
