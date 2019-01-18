/// StateCrouching()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sCrouch;
image_speed = 0.4;
if (floor(image_index) == sprite_get_number(sCrouch) - 1) image_speed = 0;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.crouching;


// Left or right inputs
if (kLeft || kRight)         nextState = states.crawling;

// Down input (on platform) --> allow time for smash attack input
if (kCrouch && platformBelow && windowTimer > oGame.smashFrames)  nextState = states.airborne;

// No down input
if (!kCrouch)                  nextState = states.idle;

// Jump input
if (kJump && canJump)        nextState = states.jumping; 

GroundedAttackInput();

// Shield 
if (kShield)                nextState = states.shielding;

// Ran off the edge -> KYS
if (!onGround)                                    nextState = states.airborne;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply traction
vx = Approach(vx, 0, traction);

// Down input (on platform) --> allow time to input a smash attack
if (kCrouch && platformBelow && windowTimer > oGame.smashFrames) y++; 

// Ran off the edge -> KYS
if (!onGround)            vx = median(vx, -airSpeed, airSpeed);

