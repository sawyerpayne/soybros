/// StateHitsun()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sHitstun;
image_speed = 0.12;

// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.hitstun;

// Enter tumbling state
if (windowTimer > hitstun && !onGround) nextState = states.tumbling;

// Enter grounded state
if (windowTimer > hitstun && onGround)     nextState = states.grounded;

// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply air friction //TODO test if this is ok
if (onGround) vx = Approach(vx, 0, traction);
else          vx = Approach(vx, 0, airFriction);

// Create cloud particles
if (!part_emitter_exists(oGame.particleSystem, emitter)) emitter = part_emitter_create(oGame.particleSystem);
part_emitter_region(oGame.particleSystem,emitter,x,x,y,y,ps_shape_ellipse,1-2);
part_emitter_stream(oGame.particleSystem,emitter,oGame.cloud,-4);
