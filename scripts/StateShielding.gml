/// StateShielding()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sShield;
image_speed = 0.4;
if (floor(image_index) == sprite_get_number(sShield) - 1) image_speed = 0;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.shielding;

// Drop Shield
if (!kShield)               nextState = states.idle;

if (canDodge){
    // Roll
    if (kLeft || kRight)    nextState = states.rolling;
    
    // Spot dodge
    if (kCrouch)              nextState = states.dodging;
}

// Allow jump out of shield
if (kJump && canJump)       nextState = states.jumping;

// Allow up-b out of shield
if (kUp && kSpecial)        nextState = states.uSpecial;

// Allow grabs out of shield
if (kGrab)                  nextState = states.grabbing;

// Got pushed off the ledge
if (!onGround)              nextState = states.airborne;

// Burst shield
if (shieldStrength <= 0)    nextState = states.hitstun;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply traction
vx = Approach(vx, 0, traction);

// Burst shield
if (shieldStrength <= 0) {
    part_particles_create(oGame.particleSystem,x + 8 * facing,y-16,oGame.spark,1);
    vy = -jumpHeight;
    hitstun = 240;    // Make sure they stay in hitstun until they land
    shieldStrength = oGame.shieldResetValue;
}

// Roll
if (kLeft || kRight) if (!TurnInput()) facing *= -1;
  
// Spot dodge
if (kCrouch)           vx = 0;

// Prevent repeatable dodges
if (windowTimer == 0)   canDodge = false;

// Rest dodge
if (!kLeft && !kRight && !kCrouch) canDodge = true;

// Allow jump out of shield but must reset shield to airdodge
if (kJump && canJump)       canAirDodge = false;
else                        canAirDodge = true;

if (windowTimer == 0) {
    // Create shield particle
    if (!part_emitter_exists(oGame.particleSystem, emitter)) emitter = part_emitter_create(oGame.particleSystem);
    
    if (playerNum == 0) {
        part_emitter_stream(oGame.particleSystem,emitter,oGame.shieldParticle1, 3);
    }
    if (playerNum == 1) {
        part_emitter_stream(oGame.particleSystem,emitter,oGame.shieldParticle2, 3);
    }
    if (playerNum == 2) {
        part_emitter_stream(oGame.particleSystem,emitter,oGame.shieldParticle3, 3);
    }
    if (playerNum == 3) {
        part_emitter_stream(oGame.particleSystem,emitter,oGame.shieldParticle4, 3);
    }
}

part_emitter_region(oGame.particleSystem,emitter,x,x,y - 16,y - 16,ps_shape_ellipse,1);

if (playerNum == 0) {
        part_type_size(oGame.shieldParticle1,ceil(shieldStrength)/50 + 0.25,ceil(shieldStrength)/50 + 0.25,0,0);
    }
    if (playerNum == 1) {
        part_type_size(oGame.shieldParticle2,ceil(shieldStrength)/50 + 0.25,ceil(shieldStrength)/50 + 0.25,0,0);
    }
    if (playerNum == 2) {
        part_type_size(oGame.shieldParticle3,ceil(shieldStrength)/50 + 0.25,ceil(shieldStrength)/50 + 0.25,0,0);
    }
    if (playerNum == 3) {
        part_type_size(oGame.shieldParticle4,ceil(shieldStrength)/50 + 0.25,ceil(shieldStrength)/50 + 0.25,0,0);
    }





