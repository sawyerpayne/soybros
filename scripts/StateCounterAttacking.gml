/// StateCounterAttacking()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sCounterAttack;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nextState = states.counterAttacking;

if (frame == sprite_get_number(sCounterAttack) - 1) {
    if (onGround)   nextState = states.idle;
    else            nextState = states.airborne;
}


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply traction or airfriction
if (onGround) vx = Approach(vx, 0, traction);
else          vx = Approach(vx, 0, airFriction);
