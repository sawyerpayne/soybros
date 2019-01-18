/// StateUSpecial()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sprite_index = sUSpecial;
image_speed = 0.15;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.uSpecial;

// Dissallow repeated upB's until landed or hit
canUpB = false;

// Character dependent special attack
switch(playerCharacter) {
    case characters.jackson:
        //if (windowTimer > 90)                    nextState = states.helpless;
        if (onGround && windowTimer > 50)          nextState = states.landing;
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

// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


// Character dependent special attack
switch(playerCharacter) {
    case characters.jackson:
        if (windowTimer < 18) {
            if (TurnInput()) facing = facing * -1;
        }
        if (windowTimer == 18) {
            var basketball = instance_create(x + 16 * facing, y - 20, oProjectile);
            basketball.xScale = 20;
            basketball.yScale = 20;
            basketball.xOffset = 0;
            basketball.yOffset = 0;
            basketball.duration = 60;
            basketball.angle = 80;
            basketball.damage = 0.2;
            basketball.persistant = 1;
            basketball.multihit   = 1;
            basketball.baseKnockback = 60;
            basketball.scalingKnockback = 1;
            basketball.knockbackType = knockback.fixed;
            basketball.shieldDamage = 0;
            basketball.sprite_index = sBasketball;
            basketball.vx = 0.1 * facing;
            basketball.vy = -5;
            basketball.grav = 0.1;
            basketball.airFriction = 0.03;
            basketball.shotBy = id;
            basketball.facing = facing;
            hitbox = HitboxCreate(50,16,facing * 16, -16, 3, 90, 6, 100, 1, knockback.fixed, 0, 0); 
        }
        // Hold still
        if (windowTimer < 35) {
            vx = 0;
            vy = 0;
        }
        
        // Begin jump
        if (windowTimer >= 35 && windowTimer < 80) {
            vy = easeOutCubic(windowTimer - 35, -9.5, 9.5, 45);
        }
        
        // Begin Fall
        if (windowTimer == 80) {
            vy = fastFallSpeed * 1.9;
            hitbox = HitboxCreate(50,16,facing * 16, -16, 999, 270, 3, 110, 0.3, knockback.scaling, 0, 0); 
        }
        
        // Landing lag
        if (onGround && windowTimer > 50){
            landingLag = 30;
            if (hitbox) instance_destroy(hitbox);
            hitbox = HitboxCreate(30,30,facing * 15, -15, 2, 60, 6, 70, 0.8, knockback.scaling, 0, 0); 
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

