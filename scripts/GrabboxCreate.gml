/// GrabboxCreate(xscale, yscale, xOffset, yOffset, duration)

_grabbox = instance_create(x, y, oGrabbox);
_grabbox.owner            = id;
_grabbox.image_xscale     = argument0/oGame.hitboxScale;
_grabbox.image_yscale     = argument1/oGame.hitboxScale;
_grabbox.xOffset          = argument2;
_grabbox.yOffset          = argument3;
_grabbox.duration         = argument4;

return _grabbox;
