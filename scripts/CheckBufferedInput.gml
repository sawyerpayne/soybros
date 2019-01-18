/// CheckBufferedInput()

// Attack input
if (kAttackHeld) {

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
if (kSmashHeld) {

    // FSmash
    if (kRight || kLeft)    nextState = states.fCharge;
    
    // USmash
    else if (kUp)           nextState = states.uCharge;
    
    // DSmash
    else if (kDown)         nextState = states.dCharge;
}

// Special input
if (kSpecialHeld) {

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
if (kGrabHeld)              nextState = states.grabbing;
