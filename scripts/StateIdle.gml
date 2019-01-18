/// StateIdle()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sIdle;
image_speed = 0.12;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.idle;

// Left or right inputs
if (kLeft || kRight) {
    if(!TurnInput()) {
        if (Smash(pHorizontal,kHorizontal))  nextState = states.dashing;   
        else                                 nextState = states.walking; 
    }
    else {
        if (Smash(pHorizontal,kHorizontal))  nextState = states.smashTurning;
        else                                 nextState = states.tiltTurning;
    }
}

// Jump input
if (kJump && canJump)       nextState = states.jumping;       

// Down input
if (kCrouch)                nextState = states.crouching;

// Attack input
if (kAttack) {

    // FTilt
    if (kRight || kLeft)    nextState = states.fTilt;
    
    // UTilt
    else if (kUp)           nextState = states.uTilt;
    
    // DTilt
    else if(kDown)          nextState = states.dTilt;
    
    // Standard
    else                    nextState = states.attacking;
}

// Smash input
if (kSmash) {

    // FSmash
    if (kRight || kLeft)    nextState = states.fCharge;
    
    // USmash
    else if (kUp)           nextState = states.uCharge;
    
    // DSmash
    else if (kDown)         nextState = states.dCharge;
}

// Special input
if (kSpecial) {

    // FSpecial
    if(kRight || kLeft)     nextState = states.fSpecial;
    
    // DSpecial
    else if (kDown)         nextState = states.dSpecial;
    
    // USpecial
    else if (kUp)           nextState = states.uSpecial;
    
    // Special
    else                    nextState = states.special;
}

// Grab input
if (kGrab)                  nextState = states.grabbing;

// Shield 
if (kShield)                nextState = states.shielding;

// Ran off the edge -> KYS
if (!onGround)              nextState = states.airborne;




// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply traction
vx = Approach(vx, 0, traction);

// Reset jump input
if (!kUp)                 canJump = true;

// Rest dodge
if (!kLeft && !kRight && !kCrouch) canDodge = true;

// Ran off the edge -> KYS
if (!onGround)            vx = median(vx, -airSpeed, airSpeed);

