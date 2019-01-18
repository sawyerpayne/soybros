/// StateFTilt()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sFTilt;
image_speed = 1;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.fTilt;

// Return to idle state
if (frame == sprite_get_number(sFTilt) - 1) nextState = states.idle;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


// Apply traction
vx = Approach(vx, 0, traction);

// Ensure correct facing
if (windowTimer == 0) {
    if (kRight)     facing = 1;
    else if (kLeft) facing = -1;
}

// Create character dependent hitbox and sound
switch(playerCharacter) {
    case characters.jackson:
        
        // Play audio
        if (frame == 0) audio_play_sound(mHitSound,1,0);
        
        // Create hitbox
        if (frame == 6 && hitbox == -1) {
            hitbox = HitboxCreate(30, 15, 12 * facing, -11, 2, 361, 7, 8, 1, 1, 1, 0);
        }
        break;
    
    default:
        break;
}

