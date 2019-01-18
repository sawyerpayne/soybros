/// StateWalking()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sWalk;
image_speed = 0.1;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.walking;

// No input
if (!kRight && !kLeft)              nextState = states.idle;

// Left or right smash input
if (Smash(pHorizontal,kHorizontal)) nextState = states.dashing;

// Jump input
if (kJump && canJump)               nextState = states.jumping;

// Down input
if (kCrouch)                          nextState = states.crouching;

GroundedAttackInput();

// Shield 
if (kShield)                nextState = states.shielding;

// Ran off the edge -> KYS
if (!onGround)                      nextState = states.airborne;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply movement
vx = facing * (baseWalkSpeed + Normalize(abs(kHorizontal)) * scaleWalkSpeed);      

// Left or right inputs
if      (kLeft)             facing = -1;
else if (kRight)            facing = 1;

// Ran off the edge -> KYS
if (!onGround)            vx = median(vx, -airSpeed, airSpeed);

