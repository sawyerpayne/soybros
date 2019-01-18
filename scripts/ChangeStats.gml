///ChangeStats(switch)

switch(argument0) {
    case("fox"):
        m = 2;
        baseAirAccel     = 0.02 * m;
        scaleAirAccel    = 0.06 * m;
        airFriction      = 0.02 * m;
        airSpeed         = 0.83 * m;
        grav             = 0.23 * m;
        weight           = 73;
        fallSpeed        = 2.8 * m;
        fastFallSpeed    = 3.4 * m;
        jumpHeight       = 3.68 * m;
        doubleJumpHeight = 3.89 * m;
        shortHop         = 2.0 * m;
        
        
        traction         = 0.08 * m;
        crawlSpeed       = 0.1 * m;
        baseWalkSpeed    = 0.1 * m;
        scaleWalkSpeed   = 1.5 * m;
        dashSpeed        = 2.02 * m;
        dashFrames       = 11;
        runTurnFrames    = 23;
        skidFrames       = 15;
        runSpeed         = 2.2 * m;
        runAccel         = 0.12 * m;
        maxJumps         = 2;
    break;
    case("jiggly"):
        m = 2;
        baseAirAccel  = 0.19 * m;
        scaleAirAccel = 0.09 * m;
        airFriction   = 0.05 * m;
        airSpeed      = 1.3 * m;
        grav          = 0.064 * m;
        weight        = 60;
        fallSpeed     = 1.3 * m;
        fastFallSpeed = 1.6 * m;
        jumpHeight    = 1.6 * m;
        doubleJumpHeight = 1.6 * m;
        shortHop      = 1.0 * m;
        
        
        traction       = 0.09 * m;
        crawlSpeed     = 0.1 * m;
        baseWalkSpeed  = 0.1 * m;
        scaleWalkSpeed = 0.6 * m;
        dashSpeed      = 1.31 * m;
        dashFrames     = 13;
        runTurnFrames  = 23;
        skidFrames     = 15;
        runSpeed       = 1.10 * m;
        runAccel       = 0.09 * m;
        maxJumps       = 5;
        break;
    default:
    break;
}
