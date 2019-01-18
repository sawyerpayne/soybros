/// UpdatePlayerSpecificStats()

// Character dependent variables
switch(playerCharacter) {
    case characters.jackson:        
        
        if (!drunk) {
            beerMeter = median(0, beerMeter - beerMeterDepletionRate, maxBeerMeter);
            if (beerMeter > maxBeerMeter/2) percent = max(0,percent - beerRegen);
        }
        else {
            beerMeter = median(0, beerMeter - drunkCooldown, maxBeerMeter);
            if (!part_emitter_exists(oGame.particleSystem, emitter)) emitter = part_emitter_create(oGame.particleSystem);
            part_emitter_region(oGame.particleSystem, emitter, x - 16, x + 16, y, y - 32, ps_shape_ellipse, ps_distr_gaussian);
            part_emitter_stream(oGame.particleSystem, emitter, oGame.bubbles, -3);
            if (beerMeter == 0) drunk = false;
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
