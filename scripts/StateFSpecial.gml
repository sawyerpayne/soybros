/// StateFSpecial()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sFSpecial;
image_speed = 0.15;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.fSpecial;


// Character dependent special attack
switch(playerCharacter) {
    case characters.jackson:
        // Return to idle state
        if (frame == sprite_get_number(sFSpecial) - 1) {
            if (onGround)                                nextState = states.idle;
            else                                         nextState = states.airborne;       //TODO helpless
        }
        
        break;
    default:
        break;
}

// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Ensure correct facing
if (windowTimer == 0) {
    if (kRight)     facing = 1;
    else if (kLeft) facing = -1;
}

// Character dependent special attack
switch(playerCharacter) {
    case characters.jackson:
        image_speed = 1;
        lunged = 1;
        var duration = (sprite_get_number(sFSpecial) - 1)/image_speed;
        var lunge = 6;
        
        // Create after image
        var afterImage = instance_create(x,y, oAfterImage);
        afterImage.sprite_index = sprite_index;
        
        // Create hitbox
        if (frame == 5 && hitbox == -1) hitbox = HitboxCreate(25*facing, 12, facing, -20, 12, 65, 9, 50, 0.88, 2, 1, 0);
        
        // Lunge
        if(windowTimer > 5) vx = easeOutCubic(windowTimer - 5, lunge * facing, airSpeed * facing, duration - 5);   
        
        vy = 0;
        if (hitbox != -1 && ds_list_size(hitbox.ignoreList) != 0)      vx = 0;
        if (frame == sprite_get_number(sFSpecial) - 1 && vx != 0)      vx = airSpeed * facing;
        fastFall = false;
        
        
        break;
    
    case characters.sawyer:
        break;
    
    case characters.jason:
        break;
    
    case characters.ben:
        break;
    
    case characters.nolan:
        break;
    
    case characters.ali:
        break;
        
    default:
        break;
}

