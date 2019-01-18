/// SpawnJason()

// SET STATS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Multiplier
m = 2;

// Ground stats
player.traction                 = 0.06 * m;
player.crawlSpeed               = 0.1 * m;
player.baseWalkSpeed            = 0.1 * m;
player.scaleWalkSpeed           = 0.8 * m; //1.0
player.dashSpeed                = 1.4 * m; //1.5
player.runSpeed                 = 1.5 * m;
player.runAccel                 = 0 * m;


// Air stats
player.maxJumps                 = 2;
player.baseAirAccel             = 0.02 * m;
player.scaleAirAccel            = 0.08 * m;
player.airFriction              = 0.016 * m;
player.airSpeed                 = 0.9 * m;
player.grav                     = 0.095 * m;
player.weight                   = 98;
player.fallSpeed                = 1.7 * m;
player.fastFallSpeed            = 2.3 * m;
player.jumpHeight               = 2.3 * m;
player.doubleJumpHeight         = 2.3 * m;
player.shortHop                 = 1.5 * m;


// Frame counters
player.dashFrames               = 10;
player.runTurnFrames            = 11; //23
player.skidFrames               = 15;
player.dodgeFrames              = 32;
player.dodgeInvincibilityFrames = 15;
player.defaultLandingFrames     = 4;
player.tiltTurnFrames           = 5;
player.runTurnFrames            = 10;
player.jumpSquatFrames          = 5;

// Player specific variables

// SET SPRITES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Ground movement sprites
player.sIdle            = sJasonIdle;
player.sCrouch          = sJasonCrouch;
player.sJump            = sJasonCrouch;
player.sDash            = sJasonDash;
player.sRun             = sJasonWalk;
player.sWalk            = sJasonWalk;
player.sCrawl           = sJasonCrouch;
player.sTurn            = sJasonTurn;
player.sTiltTurn        = sJasonTurn;
player.sSmashTurn       = sJasonTurn;
player.sRunTurn         = sJasonTurn;
player.sSkid            = sJasonTurn;
player.sLand            = sJasonCrouch;
player.sRoll            = sJasonCrouch;
player.sDodge           = sJasonTurn;
player.sShield          = sJasonTurn;
player.sGrab            = sJacksonFTilt;
player.sHold            = sJacksonHold;
player.sHeld            = sJacksonHitstun;
player.sThrow           = sJacksonFTilt;
player.sGetUp           = sJacksonGetUp;
player.sGrounded        = sJacksonGrounded;
player.sLedgeGrab       = sJacksonHitstun;

// Air sprites
player.sHitstun         = sJacksonHitstun;
player.sAirborne        = sJasonJump;
player.sTumble          = sJacksonTumble;
player.sHelpless        = sJacksonJump;

// Attack sprites
player.sAttack1         = sJacksonAttack1;
player.sAttack2         = sJacksonAttack2;
player.sAttack3         = sJacksonAttack3;
player.sDashAttack      = sJacksonFTilt;
player.sGetUpAttack     = sJacksonFTilt;

// Tilt sprites   
player.sFTilt           = sJacksonFTilt;
player.sDTilt           = sJacksonFTilt;
player.sUTilt           = sJacksonFTilt;

// Aerial sprites
player.sFAir            = sJacksonFTilt;
player.sBAir            = sJacksonFTilt;
player.sUAir            = sJacksonFTilt;
player.sDAir            = sJacksonFTilt;
player.sNAir            = sJacksonFTilt;

// Smash sprites
player.sFCharge         = sJacksonFTilt;
player.sFSmash          = sJacksonFTilt;
player.sDCharge         = sJacksonFTilt;
player.sDSmash          = sJacksonFTilt;
player.sUCharge         = sJacksonFTilt;
player.sUSmash          = sJacksonFTilt;

// Special sprites
player.sDSpecial        = sJacksonDSpecial;
player.sUSpecial        = sJacksonJump;
player.sFSpecial        = sJacksonFSpecial;
player.sSpecial         = sJacksonSpecial;


// Character specific sprites


player.playerCharacter  = characters.jason;
