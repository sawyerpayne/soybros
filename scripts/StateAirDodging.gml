/// StateAirDodging

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sRoll;
image_speed = 0.4;
if (floor(image_index) == sprite_get_number(sDodge) - 1) image_speed = 0;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.airDodging;

// Return to idle state
if (windowTimer > dodgeFrames) {
                                        nextState = states.idle;
    // Buffered input
    CheckBufferedInputAirborne();
}

// Tech land
if (onGround)                       nextState = states.idle;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Dont count gravity
vy = 0;

// Prevent repeat dodges
canDodge = false;

// Allow directional air dodge
vx = easeOutCubic(windowTimer - 5, 3 * airDodgeHor , -3 * airDodgeHor , dodgeFrames);
vy = easeOutCubic(windowTimer - 5, 3 * airDodgeVert, -3 * airDodgeVert, dodgeFrames);

// Prevent repeated air dodges
airDodge = true;
    
// Add invincibility frames
if (windowTimer == 4) invincibilityFrames = dodgeInvincibilityFrames;

// Particle effect
if (!part_emitter_exists(oGame.particleSystem, emitter)){ emitter = part_emitter_create(oGame.particleSystem);
part_emitter_region(oGame.particleSystem,emitter,x-20, x+20,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(oGame.particleSystem,emitter,oGame.skid,5);
}
