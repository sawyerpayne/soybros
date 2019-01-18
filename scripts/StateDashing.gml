///StateDashing()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sDash;
image_speed = 0.15;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.dashing;

// Enter dashing state
if (windowTimer > dashFrames)    nextState = states.running;

// No input (or frame perfect directional changes)
if ((!kLeft && !kRight) || TurnInput())          nextState = states.skidding;
 
// Smash turn immediately during initial dash    
if ((kSmashLeft || kSmashRight) && TurnInput())  nextState = states.smashTurning;

// Jump input
if (kJump && canJump)            nextState = states.jumping;

// Down input
if (kCrouch)                       nextState = states.crouching;

GroundedAttackInput();

// Shield 
if (kShield)                nextState = states.shielding;

// Ran off the edge -> KYS
if (!onGround)                   nextState = states.airborne;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply movement
vx = facing * dashSpeed;

// Left or right inputs
if      (kLeft)             facing = -1;
else if (kRight)            facing = 1;

// Create particles
if (!part_emitter_exists(oGame.particleSystem, emitter)){ emitter = part_emitter_create(oGame.particleSystem);
part_emitter_region(oGame.particleSystem,emitter,x-20, x+20,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(oGame.particleSystem,emitter,oGame.skid,5);
}

// Ran off the edge -> KYS
if (!onGround)            vx = median(vx, -airSpeed, airSpeed);
