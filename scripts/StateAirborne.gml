/// StateAirborne()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sAirborne;
image_speed = 0;
if (vy < 0) image_index = 0;
else        image_index = 1;

// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.airborne;

AerialAttackInput();

// Return to idle state
if (onGround)                    nextState = states.landing;

// Fall through platforms
if (platformBelow && kCrouch)      nextState = states.airborne;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Reset up input for air dodging after jumping from shield
if (!kShield) canAirDodge = true;

// Airdodge direction
if (kShield && !airDodge && canAirDodge) {

    airDodgeHor  = Normalize(abs(kHorizontal)) * sign(kHorizontal);
    airDodgeVert = Normalize(abs(kVertical)) * sign(kVertical);
}

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

// Reset jump input
if (!kJump && numJumps < maxJumps) canJump = true;


// Left input
if (kLeft) {
    if (vx > airSpeed)  vx = airSpeed;
    if (vx > -airSpeed) vx = Approach(vx, -airSpeed, baseAirAccel + Normalize(abs(kHorizontal)) * scaleAirAccel);  
}

// Right input
else if (kRight) {
    if (vx < -airSpeed) vx = -airSpeed;
    if (vx < airSpeed)  vx = Approach(vx, airSpeed, baseAirAccel + Normalize(abs(kHorizontal)) * scaleAirAccel); 
       
}

// No left or right inputs
else vx = Approach(vx, 0, airFriction);

// Fast fall after the peak of jump
if (kCrouch && sign(vy) > 0) fastFall = true;

// Fall through platforms
if (platformBelow && kCrouch){

    // Drop under
    y++;
    
    // Do not reset any onGround variables
    onGround = false;
}


// Return to idle state
if (onGround)                    landingLag = defaultLandingFrames;

if (!part_emitter_exists(oGame.particleSystem, emitter)){ emitter = part_emitter_create(oGame.particleSystem);
part_emitter_region(oGame.particleSystem,emitter,x-20, x+20,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(oGame.particleSystem,emitter,oGame.skid,5);
}

