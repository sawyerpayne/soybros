/// StateLedgeGrabbing()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sLedgeGrab;
image_speed = 0;

// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.ledgeGrabbing;

// Held too long
if (ledgeboxFront.ledgeReset   )   nextState = states.airborne;

// Let go of the ledge 
if (kJump && canJump)               nextState = states.jumping;

// Fall down
if (kCrouch)                        nextState = states.airborne;

// Let go
if (TurnInput())                    nextState = states.airborne;

//TODO get up

//TODO getup attack

// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Snap to the edge
vx = 0;
vy = 0;

// If its the first time grabbing the ledge since getting hit or touching the ground, gain invincibility for 60 frames
if (windowTimer == 0 && ledgeInvincibility) invincibilityFrames = 60;

// Prevent further invincibility frames until it resets
ledgeInvincibility = false;

if (ledgeHeld.x < room_width/2) {
    facing = 1;
    x = ledgeHeld.x - 10;
    y = ledgeHeld.y + 32;
}
else {
    facing = -1;
    x = ledgeHeld.x + 10;
    y = ledgeHeld.y + 32;
}                

// Reset jump variables
numJumps = 0;
fastFall = false;
airDodge = false;
canUpB   = true;
if (playerCharacter == characters.jackson){
        lunged = 0;
}

// Reset jump input
if (!kUp)                 canJump = true;

// Held too long
if (ledgeboxFront.ledgeReset) {
    ledgeHeld.ledgeHolder = -1;
    ledgeboxFront.ledgeReset = true;
}

// Jump up
//TODO make this jump higher
if (kJump && canJump) {

    ledgeHeld.ledgeHolder = -1;
    ledgeboxFront.ledgeReset = true;
}

// Let go
if (TurnInput()) {

    ledgeHeld.ledgeHolder = -1;
    ledgeboxFront.ledgeReset = true;
}

// Drop down
if (kCrouch) {

    ledgeHeld.ledgeHolder = -1;
    ledgeboxFront.ledgeReset = true;
    fastFall = true;
}

//TODO get up

//TODO getup attack
