/// StateHolding()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sHold;
image_speed = 0;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.holding;

// Throw
if ((kUp || kDown || kRight || kLeft) && canThrow) nextState = states.throwing;


// Let go
if (windowTimer > holdTimer)    nextState = states.idle;

                   



// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vx = 0;
vy = 0;

// Position them in front of you
holding.x = x + facing * 16;
holding.y = y;

// Must reset inputs before you can throw
if (!kUp && !kDown && !kRight && !kLeft) canThrow = true;

// Let go
if (windowTimer > holdTimer) {
    holding.nextState = states.idle;
    holding.vx += 1 * facing;
    vx -= 1 * facing;
    //TODO some sort of particle
}   

// Pummel
if (kAttack)    holding.percent += 3;
// Todo limit this based on animation


