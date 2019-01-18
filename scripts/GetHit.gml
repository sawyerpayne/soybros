/// GetHit()

// Calculate hit factors
if (instance_exists(hitBy)){
    percent      += hitBy.damage;
    var knockback, velocity;
    
    // No knockback moves
    if      (hitBy.knockbackType = knockback.none) knockback = 0;
    
    // Fixed knockback moves
    else if (hitBy.knockbackType = knockback.fixed) knockback = (((((11 * hitBy.baseKnockback/20) * 200/(weight + 100) * 1.4) + 18) * hitBy.scalingKnockback));
    
    // Scaling knockback moves
    else if (hitBy.knockbackType = knockback.scaling) knockback = (((((percent/10 + percent * hitBy.damage/20) * 200/(weight + 100) * 1.4) + 18) * hitBy.scalingKnockback) + hitBy.baseKnockback);

    // Counter hit on charging
    if (state == states.fCharge ||
        state == states.dCharge ||
        state == states.uCharge)    knockback *= 1.2;
        
    // Bull true;
    if (playerCharacter == characters.jackson && state = states.fSpecial) knockback *= 1.2;
        
    velocity  = knockback * 0.03 * 2;
    hitstun   = knockback * 0.4;
    
    // The hit wasn't enough to flinch
    if (knockback < oGame.flinchThresh) nextState = state;
    
    
    // The hit was enough to flinch
    else {
        var angle;
        part_particles_create(oGame.particleSystem,x + 8 * facing,y-16,oGame.spark,1);

        
        // Sakurai angle
        if (hitBy.angle == 361) {
            
            // Low percent on ground
            if (onGround && percent <= 32) angle = 0;
            
            // High percent on ground
            else               angle = 45;
        }
        else angle = hitBy.angle;
        
        vyTemp    = -velocity * sin(degtorad(angle));
        vxTemp    =  velocity * cos(degtorad(angle)) * hitBy.owner.facing;
        facing        = hitBy.owner.facing * -1;
        attacking     = false;
        nextState     = states.hitlag;
        
        // Determine if just flinch or enter hitstun
        if (knockback < oGame.tumbleThresh) flinching = true;
        else                          flinching = false;
        
        // Determine hitlag frames
        if (state == states.crouching ||
            state == states.crawling)  hitlag = floor(2/3 * floor(3+hitBy.damage/3));
        else                           hitlag = floor(3 + hitBy.damage/3);
        
    }
    
    hit           = false;
    audio_play_sound(mHurtSound,3,0);
}
