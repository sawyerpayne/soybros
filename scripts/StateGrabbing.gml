/// StateGrabing()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sGrab;
image_speed = 0.3;

// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.grabbing;

if (frame == sprite_get_number(sGrab) - 1)    nextState = states.idle;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Apply traction
vx = Approach(vx, 0, traction);

// Ensure correct facing
if (windowTimer == 0) {
    if (kRight)     facing = 1;
    else if (kLeft) facing = -1;
}

// Create character dependent grabbox and sound
switch(playerCharacter) {
    case characters.jackson:
        
        // Create hitbox
        if (windowTimer == 7 && grabbox == -1) {
            grabbox = GrabboxCreate(20*facing, 12, facing, -20, 1);
        }
        break;
    
    default:
        break;
}

