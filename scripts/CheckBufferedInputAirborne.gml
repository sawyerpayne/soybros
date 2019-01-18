/// CheckBufferedInputAirborne()

// Attack input
if (kAttackHeld) {

    // FTilt
    if (kRight || kLeft)    nextState = states.fAir;
    
    // UTilt
    else if (kUp)           nextState = states.uAir;
    
    // DTilt
    else if(kDown)          nextState = states.dAir;
    
    // Standard
    else                    nextState = states.nAir;
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
