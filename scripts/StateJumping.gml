/// StateJumping()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sJump;
image_speed = 0.12;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.jumping;

// Enter airborne state
if (windowTimer > jumpSquatFrames) nextState = states.airborne;

GroundedAttackInput();


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply traction
vx = Approach(vx, 0, traction);

// Enter airborne state
if (windowTimer > jumpSquatFrames) {

    // Regular jump 
    if (kJump) vy = -jumpHeight;
    
    // Short hop
    else       vy = -shortHop;
    
    // Angled jumps
    if (kLeft  && abs(vx) < airSpeed) vx = Normalize(abs(kHorizontal)) * -airSpeed;
    if (kRight && abs(vx) < airSpeed) vx = Normalize(abs(kHorizontal)) * airSpeed;
    
    canJump = false;
    fastFall = false;
    numJumps++;
}

// Ran off the edge -> KYS
if (!onGround)            vx = median(vx, -airSpeed, airSpeed);
