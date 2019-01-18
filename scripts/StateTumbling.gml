/// StateTumbling()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sTumble;
image_speed  = 0.5;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.tumbling;

// Escape tumbling by performing an action
if (kLeft || kRight)                   nextState = states.airborne;
if (kJump && canJump)                  nextState = states.airborne;
  
AerialAttackInput();
  
// Land without teching
if (onGround)                           nextState = states.grounded;

// TODO teching

    
// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Left input
if (kLeft) {
    //if (Smash(pHorizontal, kHorizontal)) facing = -1;
    if (vx > -airSpeed) vx = Approach(vx, -airSpeed, baseAirAccel + Normalize(abs(kHorizontal)) * scaleAirAccel);  
}

// Right input
else if (kRight) {
    //if (Smash(pHorizontal, kHorizontal)) facing = 1;  
    if (vx < airSpeed) vx = Approach(vx, airSpeed, baseAirAccel + Normalize(abs(kHorizontal)) * scaleAirAccel);  
}

// No left or right inputs
else vx = Approach(vx, 0, airFriction);

if (kJump && canJump)  { 

    // Double jump
    canJump = false;
    fastFall = false;
    numJumps++;
    vy = -doubleJumpHeight;
    
    // Angled jumps
    if (kLeft)  vx = -airSpeed;
    if (kRight) vx =  airSpeed;
} 

// Fast fall after the peak of jump
if (kCrouch && sign(vy) > 0) fastFall = true;
