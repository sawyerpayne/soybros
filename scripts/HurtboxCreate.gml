/// HurtboxCreate(xscale, yscale, xOffset, yOffset)

_hurtbox = instance_create(x, y, oHurtbox);
_hurtbox.owner        = id;
_hurtbox.image_xscale = argument0/oGame.hitboxScale;
_hurtbox.image_yscale = argument1/oGame.hitboxScale;
_hurtbox.xOffset      = argument2;
_hurtbox.yOffset      = argument3;

return _hurtbox;
