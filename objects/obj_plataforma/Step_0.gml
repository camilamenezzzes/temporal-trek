hspd = move_dir * move_spd;

if (place_meeting(x + sign(hspd), y, Obj_Bloco)) {
    move_dir *= -1;
}

var c = place_meeting(x + sign(hspd), y, Obj_Player) or place_meeting(x, y - 1, Obj_Player);

if (c) {
    with (Obj_Player) {
        if (!place_meeting(x + other.hspd, y, Obj_Bloco)) {
            x += other.hspd;
        }
    }
}

