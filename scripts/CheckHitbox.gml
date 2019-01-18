/// CheckHitbox()
// Hitbox check
if (hitbox != -1) {
    with (hitbox) {
    
        // Move hitbox
        x = other.x + xOffset;
        y = other.y + yOffset;
        
        // Collision check
        with (oHurtbox) { 
            
            // Ignore self
            if (place_meeting(x,y,other) && other.owner != owner) {

                with (other) {
                    
                    // Check ignore list
                    for (i = 0; i < ds_list_size(ignoreList); i++) {
                        if (ignoreList[|i] == other.owner) {
                            ignore = true;
                            break;
                        }
                    }
                    
                    // Check if we can hit them
                    if (!ignore && other.owner.invincibilityFrames == 0) {
                        
                        // Confirm the hit
                        if (other.owner.state != states.shielding) {
                        
                            // Set variables of attacker
                            owner.hitlag = floor(3 + damage/3);
                            owner.previousState = owner.state;
                            owner.nextState = states.hitlag;
                            owner.state     = states.hitlag;
                            owner.attacking = true;
                            owner.vxTemp    = owner.vx;
                            owner.vyTemp    = owner.vy;
                            
                            // Set variables of the defender
                            other.owner.attacking = false;
                            other.owner.hit = true;
                            other.owner.hitBy = id;
                            ds_list_add(ignoreList, other.owner);
                            
                            // Remove defender from ledge if they are grabbing
                            if (other.owner.state == states.ledgeGrabbing) {
                                other.owner.ledgeHeld.ledgeHolder = -1;
                                other.owner.ledgeboxFront.ledgeReset = true;
                            }
                        }
                        
                        // Reduce shield strength and slide opponent back
                        else {
                            part_particles_create(oGame.particleSystem,x + 8 * other.owner.facing,y-16,oGame.spark,1);
                            other.owner.shieldStrength -= damage * oGame.shieldDamageRatio;
                            other.owner.shieldStrength  -= shieldDamage;
                            ds_list_add(ignoreList, other.owner);
                            if (other.owner.x > owner.x) other.owner.vx += 1; //TODO test shield slide value
                            else                         other.owner.vx -= 1; //"                           "
                        }
                    }
                }
            }
        }
        // TODO glancing blows on hitbox collision but no hurtbox collision
    }
}
