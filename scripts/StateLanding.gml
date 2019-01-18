/// StateLanding()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sLand;
image_speed  = 0.4;
if (floor(image_index) == sprite_get_number(sCrouch) - 1) image_speed = 0;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.landing;

if (windowTimer >= landingLag ) {
    nextState = states.idle;
    if (kDown) nextState = states.crouching;
}

// Ran off the edge -> KYS
if (!onGround)            vx = median(vx, -airSpeed, airSpeed);

// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply traction
vx = Approach(vx, 0, traction);

if (kLeft)  facing = -1;
if (kRight) facing = 1;

if (!part_emitter_exists(oGame.particleSystem, emitter)){ emitter = part_emitter_create(oGame.particleSystem);
part_emitter_region(oGame.particleSystem,emitter,x-20, x+20,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(oGame.particleSystem,emitter,oGame.skid,5);
}

// Ran off the edge -> KYS
if (!onGround)            vx = median(vx, -airSpeed, airSpeed);
