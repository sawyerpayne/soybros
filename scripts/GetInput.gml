/// GetInput(playerNum)
if (oGame.debug) {
    if (argument0 == 1) {
        kSmash = 1;
        kLeft = 1;
        
    }
}

if (gamepad_is_connected(argument0)) {
    kHorizontal  = gamepad_axis_value(argument0, gp_axislh);
    kVertical    = gamepad_axis_value(argument0, gp_axislv);
    
    kRight       = kHorizontal > oGame.rightThresh;
    kLeft        = kHorizontal < oGame.leftThresh;
    kSmashRight  = kHorizontal > oGame.rightSmashThresh;
    kSmashLeft   = kHorizontal < oGame.leftSmashThresh;
    kSmashUp     = kVertical   < oGame.upSmashThresh;
    kSmashDown   = kVertical   > oGame.downSmashThresh;
    kUp          = kVertical   < oGame.upThresh;
    kCrouch      = kVertical   > oGame.crouchThresh;
    kDown        = kVertical   > oGame.downThresh;// && kHorizontal < oGame.rightThresh && kHorizontal > oGame.leftThresh;
    kJump        = kVertical   < oGame.jumpThresh || 
                        gamepad_button_check        (argument0, gp_face4);
    kAttack           = gamepad_button_check_pressed(argument0, gp_face2);
    kAttackHeld       = gamepad_button_check        (argument0, gp_face2);
    kSmash            = gamepad_button_check_pressed(argument0, gp_face3);
    kSmashHeld        = gamepad_button_check        (argument0, gp_face3);
    kSpecial          = gamepad_button_check_pressed(argument0, gp_face1);
    kSpecialHeld      = gamepad_button_check        (argument0, gp_face1);
    
    kShieldPressed    = gamepad_button_check_pressed(argument0, gp_shoulderrb) ||
                        gamepad_button_check_pressed(argument0, gp_shoulderlb);
    kShield           = (gamepad_button_value(argument0, gp_shoulderrb) > oGame.shieldThresh) ||
                        (gamepad_button_value(argument0, gp_shoulderlb) > oGame.shieldThresh);
    kGrab             = gamepad_button_check_pressed(argument0, gp_shoulderr) ||
                        gamepad_button_check_pressed(argument0, gp_shoulderl);
    kGrabHeld         = gamepad_button_check        (argument0, gp_shoulderr) ||
                        gamepad_button_check        (argument0, gp_shoulderl);
    kUpTaunt          = gamepad_button_check_pressed(argument0, gp_padu);
    kDownTaunt        = gamepad_button_check_pressed(argument0, gp_padd);
    kSideTaunt        = gamepad_button_check_pressed(argument0, gp_padr) ||
                        gamepad_button_check_pressed(argument0, gp_padl);
}

