/// StateCountering()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sCounter;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nextState = states.countering;

if (windowTimer > counterTimer) {
    if (onGround)   nextState = states.idle;
    else            nextState = states.airborne;
}


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply traction or airfriction
if (onGround) vx = Approach(vx, 0, traction);
else          vx = Approach(vx, 0, airFriction);
