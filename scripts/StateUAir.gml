/// StateUAir()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sUAir;
image_speed = 0.3;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.uAir;

// Return to airborne state
if (frame == sprite_get_number(sUAir) - 1) nextState = states.airborne;

// Enter landing state
if (onGround)                    nextState = states.landing;

// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


// Left input
if (kLeft) if (vx > -airSpeed) vx = Approach(vx, -airSpeed, baseAirAccel + Normalize(abs(kHorizontal)) * scaleAirAccel);  

// Right input
else if (kRight) if (vx < airSpeed) vx = Approach(vx, airSpeed, baseAirAccel + Normalize(abs(kHorizontal)) * scaleAirAccel);  

// No left or right inputs
else vx = Approach(vx, 0, airFriction);

// Fast fall after the peak of jump
if (kCrouch && sign(vy) > 0) fastFall = true;

// Create character dependent hitbox and sound
switch(playerCharacter) {
    case characters.jackson:
    
        // Play audio
        if (frame == 0) audio_play_sound(mHitSound,1,0);
        
        // Create hitbox
        if (frame == 2 && hitbox == -1) {
            hitbox = HitboxCreate(10*facing, 15, 0, -32, 8, 80, 8, 13, 1, 2, 1, 0);
        }
        break;
    
    default:
        break;
}

// Enter landing state
if (onGround) {
    hitbox = -1;
    landingLag = 15;
}
