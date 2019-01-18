/// StateSmashTurning()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sSmashTurn;
image_speed = 0;

// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.smashTurning;

// Return to idle state in opposite direction
if (windowTimer == 3)                                 nextState = states.idle;

// Actualize turn
if (windowTimer == 3)
    if (kSmashLeft || kSmashRight)                     nextState = states.dashing;

// Jump input
if (kJump && canJump)                                  nextState = states.jumping;   

// Down input
if (kCrouch)                                             nextState = states.crouching;

GroundedAttackInput();

// Shield 
if (kShield)                nextState = states.shielding;

// Ran off the edge -> KYS
if (!onGround)                   nextState = states.airborne;

// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply traction
vx = Approach(vx, 0, traction);

// Actualize turn
if (windowTimer == 1) facing *= -1;

// Attack input (check for delayed input smash attacks)
if (kAttack || kSpecial) {
    if (windowTimer < oGame.smashFrames) facing *= -1;
}

if (!part_emitter_exists(oGame.particleSystem, emitter)){ emitter = part_emitter_create(oGame.particleSystem);
part_emitter_region(oGame.particleSystem,emitter,x-20, x+20,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(oGame.particleSystem,emitter,oGame.skid,5);
}
// Ran off the edge -> KYS
if (!onGround)            vx = median(vx, -airSpeed, airSpeed);
