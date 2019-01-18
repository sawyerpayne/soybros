/// StateAttack()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if (numA == 1) sprite_index = sAttack1;
if (numA == 2) sprite_index = sAttack2;
if (numA == 3) sprite_index = sAttack3;
image_speed = 1;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.attacking;

// Return to idle state
if (numA == 1 && frame == sprite_get_number(sAttack1) - 1) {
    if (combo) nextState = states.attacking;
    else       nextState = states.idle;
}
if (numA == 2 && frame == sprite_get_number(sAttack2) - 1) {
    if (combo) nextState = states.attacking;
    else       nextState = states.idle;
}
if (numA == 3 && frame == sprite_get_number(sAttack3) - 1) nextState = states.idle;

// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


// Apply traction
vx = Approach(vx, 0, traction);

// Create character dependent hitbox and sound
switch(playerCharacter) {
    case characters.jackson:
        
        
        // Play audio
        if (windowTimer == 1) audio_play_sound(mHitSound,1,0);
        
        // 1st hit hitbox
        if (frame == 2 && hitbox == -1 && numA == 1) {
            hitbox = HitboxCreate(30, 15, 12 * facing, -11, 2, 80, 2.5, 15, 1, 1, 1, 0);
        }
        
        // 2nd hit hitbox
        if (frame == 2 && hitbox == -1 && numA == 2) {
            hitbox = HitboxCreate(30, 15, 12 * facing, -11, 2, 80, 1.5, 18, 1, 1, 1, 0);
        }
        
        // 3rd hit hitbox
        if (frame == 7 && hitbox == -1 && numA == 3) {
            hitbox = HitboxCreate(30, 25, 15 * facing, -17, 3, 361, 4, 45, 0.8, 1, 1, 0);
        }
        
        if (kAttack && numA < maxCombo && combo == false) {
            combo = true;
        }
        
        if (numA == 1 && frame == sprite_get_number(sAttack1) - 1) {
            if (combo) numA++;
            else       numA = 1;
            image_index = 0;
            combo = false;
        }
        else if (numA == 2 && frame == sprite_get_number(sAttack2) - 1) {
            if (combo) numA++;
            else       numA = 1;
            image_index = 0;
            combo = false;
        }
        else if (numA == 3 && frame == sprite_get_number(sAttack3) - 1) {
            numA = 1;
            image_index = 0;
            combo = false;
        }
    
    default:
        break;
}

