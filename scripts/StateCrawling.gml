/// StateCrawling()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sCrawl;
image_speed = 0.12;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.crawling;

// No down input
if (!kCrouch)                             nextState = states.idle;

// No left or right inputs, but still crouching
if (!kRight && !kLeft && kCrouch)         nextState = states.crouching;

// Jump input
if (kJump && canJump)                   nextState = states.jumping;

GroundedAttackInput();

// Shield 
if (kShield)                nextState = states.shielding;

// Ran off the edge -> KYS
if (!onGround)                          nextState = states.airborne;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply movement
vx = facing * crawlSpeed;

// Left or right inputs
if      (kLeft)             facing = -1;
else if (kRight)            facing = 1;

// No left or right inputs, but still crouching
if (!kRight && !kLeft && kCrouch) image_index  = 3;

// Ran off the edge -> KYS
if (!onGround)            vx = median(vx, -airSpeed, airSpeed);


