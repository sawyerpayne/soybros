/// StateSpecial()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sSpecial;
image_speed = 1;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.special;

// Character dependent special attack
switch(playerCharacter) {
    case characters.jackson:
        // Return to idle state
        if (frame == sprite_get_number(sSpecial) - 1) {
            if (onGround)                                nextState = states.idle;
            else                                         nextState = states.airborne;       //TODO helpless
        }
        
        break;
    default:
        break;
}


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


// Apply traction
vx = Approach(vx, 0, traction);

// Character dependent special attack
switch(playerCharacter) {
    case characters.jackson:
    
        if (frame == 8 && ammo != 0) {
            var cd = instance_create(x, y - 20, oProjectile);
            if (irandom(14) == 0) {
                cd.xScale = 15;
                cd.yScale = 15;
                cd.xOffset = 0;
                cd.yOffset = 0;
                cd.duration = 50;
                cd.angle = 361;
                cd.damage = 10;
                cd.baseKnockback = 35;
                cd.scalingKnockback = 1.5;
                cd.knockbackType = 2;
                cd.shieldDamage = 10;
                cd.persistant = 0;
                cd.sprite_index = sRecord;
                cd.vx = 4 * facing;
                cd.vy = -3;
                cd.grav = 0.2;
                cd.airFriction = 0.03;
                cd.shotBy = id;
                cd.facing = facing;
            }
            else {
                cd.xScale = 10;
                cd.yScale = 10;
                cd.xOffset = 0;
                cd.yOffset = 0;
                cd.duration = 50;
                cd.angle = 361;
                cd.damage = 5;
                cd.baseKnockback = 22;
                cd.scalingKnockback = 0.20;
                cd.knockbackType = 2;
                cd.shieldDamage = 0;
                cd.persistant = 0;
                cd.sprite_index = sCD;
                cd.vx = 4 * facing;
                cd.vy = -3;
                cd.grav = 0.2;
                cd.airFriction = 0.02;
                cd.shotBy = id;
                cd.facing = facing;
            
            }
            ammo--;
        }
        if (!onGround) {
            // Left input
            if (kLeft) {
                //if (Smash(pHorizontal, kHorizontal)) facing = -1;
                if (vx > -airSpeed) vx = Approach(vx, -airSpeed, baseAirAccel + Normalize(abs(kHorizontal)) * scaleAirAccel);  
            }
            
            // Right input
            else if (kRight) {
                //if (Smash(pHorizontal, kHorizontal)) facing = 1;  
                if (vx < airSpeed) vx = Approach(vx, airSpeed, baseAirAccel + Normalize(abs(kHorizontal)) * scaleAirAccel);  
            }
            
            // No left or right inputs
            else vx = Approach(vx, 0, airFriction);
        }
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

