/// HitboxCreate(xscale, yscale, xOffset, yOffset, duration, angle, damage, baseKnockback, scalingKnockback, knockbackType, shieldDamage, multihit)

_hitbox = instance_create(x, y, oHitbox);
_hitbox.owner            = id;
_hitbox.image_xscale     = argument0/oGame.hitboxScale;
_hitbox.image_yscale     = argument1/oGame.hitboxScale;
_hitbox.xOffset          = argument2;
_hitbox.yOffset          = argument3;
_hitbox.duration         = argument4;
_hitbox.angle            = argument5;
_hitbox.damage           = argument6;
_hitbox.baseKnockback    = argument7;
_hitbox.scalingKnockback = argument8;
_hitbox.knockbackType    = argument9;
_hitbox.shieldDamage     = argument10;
_hitbox.multihit         = argument11;

return _hitbox;
