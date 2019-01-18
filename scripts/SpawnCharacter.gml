/// SpawnCharacter(playerNum, spawnLocation, character, stocks);
var xSpawn;
var ySpawn;

// Get spawn location
switch (argument1) {
    case -1:
        xSpawn = oGame.respawnX;
        ySpawn = oGame.respawnY; 
        player = instance_create(xSpawn, ySpawn, oPlayer);
        player.facing = 1;
        break;
    case 0:
        xSpawn = oGame.p1StartX;
        ySpawn = oGame.p1StartY; 
        player = instance_create(xSpawn, ySpawn, oPlayer);
        player.facing = 1;
        break;
    case 1:
        xSpawn = oGame.p2StartX;
        ySpawn = oGame.p2StartY;
        player = instance_create(xSpawn, ySpawn, oPlayer);
        player.facing = -1;
        break;
    case 2:
        xSpawn = oGame.p3StartX;
        ySpawn = oGame.p3StartY;
        player = instance_create(xSpawn, ySpawn, oPlayer);
        player.facing = 1;
        break;
    case 3:
        xSpawn = oGame.p4StartX;
        ySpawn = oGame.p4StartY;
        player = instance_create(xSpawn, ySpawn, oPlayer);
        player.facing = -1;
        break;
    default:
        break;
}


// Set stats
switch (argument2) {
    case characters.jackson:
        SpawnJackson();
        break;
        
    case characters.sawyer:
        SpawnSawyer();
        break;
        
    case characters.hansen:
        SpawnHansen();
        break;
    
    case characters.ben:
        SpawnBen();
        break;
    
    case characters.nolan:
        SpawnNolan();
        break;
        
    case characters.ali:
        SpawnAli();
        break;
        
    case characters.jason:
        SpawnJason();
        break;
}

player.percent      = 0;
player.playerNum    = argument0;
player.stocks       = argument3;
playerID[argument0] = player;

return player;
