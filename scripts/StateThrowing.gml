/// StateThrowing()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sThrow;
image_speed = 0.3;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.throwing;

// Return to idle state
if (frame == sprite_get_number(sThrow) - 1) {
                                            
    nextState = states.idle;
    CheckBufferedInput();  
}

// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vx = 0;
vy = 0;
canThrow = false;

// TODO create actual hitboxes
// Throw the target
if (windowTimer == 0) {
    var hitstun = 30;
    
    if (kUp) {
        holding.vy = -5;
        holding.hitstun   = hitstun;
        holding.nextState = states.hitstun;
    }
    else if (kDown) {
        holding.vy = 5;
        holding.hitstun   = hitstun;
        holding.nextState = states.hitstun;
    }
    else if (kRight) {
        holding.vy = -3;
        holding.vx = 3;
        holding.hitstun   = hitstun;
        holding.nextState = states.hitstun;
    }
    else if (kLeft) {
        holding.vy = -3;
        holding.vx = -3;
        holding.hitstun   = hitstun;
        holding.nextState = states.hitstun;
    }
}
