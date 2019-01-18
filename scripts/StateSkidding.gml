/// StateSkidding()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sSkid;
image_speed = 0;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// TODO CANCEL INTO SPECIAL MOVE, maybe allow skid cancelling through turning or crouching

// Default next state
nextState = states.skidding;

// Enter idle state
if (windowTimer > skidFrames) {
                                            
    nextState = states.idle;
    CheckBufferedInput();  
}

if      (TurnInput())                        nextState = states.runTurning;
else if (Smash(pHorizontal,kHorizontal))     nextState = states.dashing;

 
// Jump input
if (kJump && canJump)                   nextState = states.jumping;  

// Grab input
if (kGrab)                              nextState = states.grabbing;

// Shield 
if (kShield)                            nextState = states.shielding;

// Ran off the edge -> KYS
if (!onGround)                          nextState = states.airborne;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply traction
vx = Approach(vx, 0, traction);

// Create particles
if (!part_emitter_exists(oGame.particleSystem, emitter)){ emitter = part_emitter_create(oGame.particleSystem);
part_emitter_region(oGame.particleSystem,emitter,x-20, x+20,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(oGame.particleSystem,emitter,oGame.skid,5);
}

// Ran off the edge -> KYS
if (!onGround)            vx = median(vx, -airSpeed, airSpeed);
