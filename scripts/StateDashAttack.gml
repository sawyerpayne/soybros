/// StateDashAttack()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sDashAttack;
image_speed = 0.3;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.dashAttacking;

// Return to idle state
if (frame == sprite_get_number(sDashAttack) - 1) nextState = states.idle;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


// Apply traction
//vx = Approach(vx, 0, traction);
vx = facing * runSpeed;

// Create character dependent hitbox and sound
switch(playerCharacter) {
    case characters.jackson:
        
        // Play audio
        if (frame == 0) audio_play_sound(mHitSound,1,0);
        
        // Create hitbox
        if (frame == 2 && hitbox == -1) {
            hitbox = HitboxCreate(15*facing, 12, facing, -20, 8, 361, 8, 13, 1, 1, 1, 0);
        }
        break;
    
    default:
        break;
}

