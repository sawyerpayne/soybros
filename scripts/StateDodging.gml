/// StateDodging()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sDodge;
image_speed = 0.4;

if (floor(image_index) == sprite_get_number(sDodge) - 1) image_speed = 0;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.dodging;

// Return to idle state
if (windowTimer > dodgeFrames) {
                                            nextState = states.idle;
    CheckBufferedInput();
    
}


// TODO prevent rolling off edge
// Ran off the edge -> KYS
if (!onGround)                          nextState = states.airborne;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Dodge movement
vx = 0;

// Prevent repeat dodges
canDodge = false;

// Add invincibility frames
if (windowTimer == 4) invincibilityFrames = dodgeInvincibilityFrames;

// Particl effect
if (!part_emitter_exists(oGame.particleSystem, emitter)){ emitter = part_emitter_create(oGame.particleSystem);
part_emitter_region(oGame.particleSystem,emitter,x-20, x+20,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(oGame.particleSystem,emitter,oGame.skid,5);
}
