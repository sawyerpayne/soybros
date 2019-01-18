/// StateRunTurning()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sRunTurn;
image_speed = 0;

// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.runTurning;

// Return to idle state in opposite direction
if (windowTimer == runTurnFrames)               nextState = states.idle;

// Actualize turn
if (windowTimer == runTurnFrames && TurnInput()){
    if (kSmashLeft || kSmashRight)              nextState = states.dashing;
    else                                        nextState = states.walking;
}

// Jump input
if (kJump && canJump)                           nextState = states.jumping;   

GroundedAttackInput();

// Shield 
if (kShield)                nextState = states.shielding;

// Ran off the edge -> KYS
if (!onGround)                          nextState = states.airborne;

// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply traction
vx = Approach(vx, 0, traction);

// Actualize turn
if (windowTimer == runTurnFrames) facing *= -1;

if (!part_emitter_exists(oGame.particleSystem, emitter)){ emitter = part_emitter_create(oGame.particleSystem);
part_emitter_region(oGame.particleSystem,emitter,x-20, x+20,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(oGame.particleSystem,emitter,oGame.skid,5);
}

// Ran off the edge -> KYS
if (!onGround)            vx = median(vx, -airSpeed, airSpeed);

