// StateGetUpAttacking()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sGetUpAttack;
image_speed = 0.3;

// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.getUpAttacking;

// Return to idle state
if (frame == sprite_get_number(sGetUpAttack) - 1) nextState = states.idle;

// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


// Add invincibility frames
invincibilityFrames = 30;

// Create character dependent hitbox and sound
switch(playerCharacter) {
    case characters.jackson:
        
        
        
        // Create hitbox
        if (frame == 3 && hitbox == -1) {
            // Play audio
            if (frame == 0) audio_play_sound(mHitSound,1,0);
            hitbox = HitboxCreate(20, 10, 10 * facing, -5, 2, 361, 8, 13, 1, 1, 1, 0);
        }
        // Create hitbox
        if (frame == 5 && hitbox == -1) {
            // Play audio
            if (frame == 0) audio_play_sound(mHitSound,1,0);
            hitbox = HitboxCreate(20, 10, -10 * facing, -5, 2, 361, 8, 13, 1, 1, 1, 0);
        }
        break;
    
    default:
        break;
}

