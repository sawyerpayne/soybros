/// StateRunning()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sRun;
image_speed = 0.1;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.running;

// No input (or frame perfect directional changes)
if (!kLeft  && !kRight ||
     TurnInput())                nextState = states.skidding;
       
// Jump input
if (kJump && canJump)            nextState = states.jumping;

// Down input
if (kCrouch)                       nextState = states.crouching;

GroundedAttackInput();

// Shield 
if (kShield)                nextState = states.shielding;

// Dash attack override
if (kAttack)                     nextState = states.dashAttacking;

// Ran off the edge -> KYS
if (!onGround)                   nextState = states.airborne;



// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply movement
vx = Approach(vx,facing * runSpeed, runAccel);

// Left or right inputs
if      (kLeft)             facing = -1;
else if (kRight)            facing = 1;

// Ran off the edge -> KYS
if (!onGround)            vx = median(vx, -airSpeed, airSpeed);



