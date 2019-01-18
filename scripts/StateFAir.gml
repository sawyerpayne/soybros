/// StateFAir()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sFAir;
image_speed = 1;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.fAir;

// Return to airborne state
if (frame == sprite_get_number(sFAir) - 1) nextState = states.airborne;

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
        if (frame == 17 && hitbox == -1) {
            hitbox = HitboxCreate(30, 15, 12 * facing, -11, 4, 280, 12, 30, 0.8, 2, 1, 0);
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
