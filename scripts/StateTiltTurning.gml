/// StateTiltTurning()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sTiltTurn;
image_speed = 0;

// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.tiltTurning;

// Return to idle state in opposite direction
if (windowTimer == tiltTurnFrames)              nextState = states.idle;

// Actualize turn
if (windowTimer == tiltTurnFrames && smashTurn) nextState = states.dashing;

// Jump input
if (kJump && canJump)                           nextState = states.jumping; 

if (Smash(pHorizontal,kHorizontal) && TurnInput())      nextState = states.smashTurning;

// Down input
if (kCrouch)                                    nextState = states.crouching;

GroundedAttackInput();

// Shield 
if (kShield)                nextState = states.shielding;

// Ran off the edge -> KYS
if (!onGround)                                          nextState = states.airborne;

// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply traction
vx = Approach(vx, 0, traction);

// Read input on second frame of tilt turn
if (windowTimer == 1) smashTurn = (Smash(pHorizontal,kHorizontal));

// Read input on second frame of tilt turn
if (windowTimer == 2) smashTurn = smashTurn || (Smash(pHorizontal,kHorizontal));

// Actualize turn
if (windowTimer == tiltTurnFrames) facing *= -1;

// Ran off the edge -> KYS
if (!onGround)            vx = median(vx, -airSpeed, airSpeed);
