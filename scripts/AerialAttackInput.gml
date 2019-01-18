/// AerialAttackInput()

// Attack input
if (kAttack || kSmash) {

    // FTilt
    if (kRight || kLeft) {   
        if TurnInput()      nextState = states.bAir;
        else                nextState = states.fAir;
    }
    
    // UTilt
    else if (kUp)           nextState = states.uAir;
    
    // DTilt
    else if(kDown)          nextState = states.dAir;
    
    // Standard
    else                    nextState = states.nAir;
}

// Special input
if (kSpecial) {

    // FSpecial
    if(kRight || kLeft)     {
        if (playerCharacter != characters.jackson) nextState = states.fSpecial;
        else if (lunged == 0)                       nextState = states.fSpecial;
    }
    // DSpecial
    else if (kDown)         nextState = states.dSpecial;
    
    // USpecial
    else if (kUp)           nextState = states.uSpecial;
    
    // Special
    else                    nextState = states.special;
}

// Airdodge
if (kShield && !airDodge && canAirDodge)                nextState = states.airDodging;
