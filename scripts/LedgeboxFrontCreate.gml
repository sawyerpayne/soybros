/// LedgeboxFrontCreate(xscale, yscale, xOffset, yOffset)

_ledgebox = instance_create(x, y, oLedgeboxFront);
_ledgebox.owner        = id;
_ledgebox.image_xscale = argument0;
_ledgebox.image_yscale = argument1;
_ledgebox.xOffset      = argument2;
_ledgebox.yOffset      = argument3;

return _ledgebox;
