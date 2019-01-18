/// StateHitlag()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
image_speed = 0;

if(!attacking) {
    sprite_index = sHitstun;
}

// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.hitlag;

if (windowTimer > hitlag) {

    // Defender
    if (!attacking) {
        
        // Reset up B 
        canUpB = true;
        
        // Reset ledge invincibility frames
        ledgeInvincibility = true;
        
        // Attack not enough to tumble
        if      (flinching) nextState = states.flinching;  
        
        // Attack enough to tumble  
        else                nextState = states.hitstun;
    }
    
    // Attacker
    else {
    
        // Return to revious state
        nextState = previousState;
        
        // Don't reset window and frames
        state = nextState;
    }

}


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Freeze movement speed
vx = 0;
vy = 0;


// Only allow double jumps out of hit
if (!attacking){
    if (numJumps = 0) numJumps = 1;
    if (playerCharacter == characters.jackson) lunged = 0;
    if (numJumps < maxJumps) canJump  = true;
    fastFall = false;
    airDodge = false;
    canUpB   = true;
    ledgeInvincibility = true;
}

// Return to previous movement speed
if (windowTimer > hitlag) {

    // Reset
    vx = vxTemp;
    vy = vyTemp;
}

