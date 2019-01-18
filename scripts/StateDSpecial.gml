/// StateDSpecial()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sDSpecial;
image_speed = 0.2;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.dSpecial;

// Return to idle state
if (frame == sprite_get_number(sDSpecial) - 1) {
    if (onGround) nextState = states.idle;
    else          nextState = states.airborne;
}

switch (playerCharacter) {
    case characters.jackson:
        if (drunk) {
           if (onGround) nextState = states.idle;
           else          nextState = states.airborne;
        }
        break;
    default:
        break;
}


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

fastFalling = false;

// Character dependent special attack
switch(playerCharacter) {
    case characters.jackson:
    
        // Can only use the move if he's not drunk
        if (!drunk) {
        
            if (!part_emitter_exists(oGame.particleSystem, emitter)) emitter = part_emitter_create(oGame.particleSystem);
            part_emitter_region(oGame.particleSystem, emitter, x - 16, x + 16, y, y - 32, ps_shape_ellipse, ps_distr_gaussian);
            part_emitter_stream(oGame.particleSystem, emitter, oGame.bubbles, -3);
            
            if (windowTimer == 70) {
                //percent = max(0,percent-5);
                beerMeter = median(0, beerMeter + beerIncreaseRate, maxBeerMeter);
                if (beerMeter == maxBeerMeter) drunk = true;
            }
        }
        // Apply traction or airFriction
        if (onGround) vx = Approach(vx, 0, traction);
        else          vx = Approach(vx, 0, airFriction/2)
        break;
    
    case characters.sawyer:
        break;
    
    case characters.jason:
        break;
    
    case characters.ben:
        break;
    
    case characters.nolan:
        break;
    
    case characters.ali:
        break;
        
    default:
        break;
}

