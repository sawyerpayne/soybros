/// StateFSmash()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sFSmash;
image_speed = 1;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.fSmash;

// Return to idle state
if (frame == sprite_get_number(sFSmash) - 1) nextState = states.idle;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


// Apply traction
vx = Approach(vx, 0, traction);

// Create character dependent hitbox and sound
switch(playerCharacter) {
    case characters.jackson:
        
        // Play audio
        if (windowTimer == 1) audio_play_sound(mHitSound,1,0);
        
        // Create hitbox
        if (frame == 15 && hitbox == -1) {
            hitbox = HitboxCreate(30, 15, 12 * facing, -11, 3, 361, 14, 25, 1.03, 2, 1, 0);
        }
        break;
    
    default:
        break;
}

