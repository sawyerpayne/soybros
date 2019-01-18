/// CursorCreate(x,y,playerNum)

_cursor = instance_create(argument0, argument1, oCursor);
_cursor.playerNum = argument2;

switch (_cursor.playerNum) {
    
    case 0:
        _cursor.sprite_index = sCursor1;
        break;
    case 1:
        _cursor.sprite_index = sCursor2;
        break;
    case 2:
        _cursor.sprite_index = sCursor3;
        break;
    case 3:
        _cursor.sprite_index = sCursor4;
        break;
    case -1:
        _cursor.sprite_index = sCursorAll;
    default:
        break;
}

_cursor.image_speed = 0;
return _cursor;
