/// StateGrounded()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sGrounded;
image_speed  = 0.12;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.grounded;


if (windowTimer > oGame.getUpTimer)   nextState = states.gettingUp;

if (windowTimer > oGame.groundedFrames) {
    if (kAttack) nextState = states.getUpAttacking;
    else if (kLeft || kRight) nextState = states.rolling;
}



// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Stop
vx = 0;
vy = 0;

// Set invincibility frames
if (windowTimer == 0)   invincibilityFrames = 30;

if (windowTimer > oGame.groundedFrames) {
    if (kLeft) facing = 1;
    else if (kRight) facing = -1;
}

// Particle effect
if (!part_emitter_exists(oGame.particleSystem, emitter)){ emitter = part_emitter_create(oGame.particleSystem);
part_emitter_region(oGame.particleSystem,emitter,x-20, x+20,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(oGame.particleSystem,emitter,oGame.skid,5);
}
