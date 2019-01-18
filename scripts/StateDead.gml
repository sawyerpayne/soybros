/// StateDead()

// SET SPRITE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
vx = 0;
vy = 0;


// DETERMINE NEXT STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Default next state
nextState = states.dead;


// ACTION OF STATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

x = 0;
y = 0;

// Respawn 
if (windowTimer > oGame.respawnTimer) {

    // Game over
    if (stocks == 0) {
        audio_play_sound(mGameoverSound, 6, 0);
        
    // Replace current player obj with new player obj
    } else oFightController.playerID[playerNum] = SpawnCharacter(playerNum, -1, playerCharacter, stocks);
    
    // Remove old player obj
    instance_destroy(hurtbox);
    instance_destroy(ledgeboxRear);
    instance_destroy(ledgeboxFront);
    if(hitbox) instance_destroy(hitbox);
    instance_destroy();
}   
