var hitbox_range = 70;

global.placar = global.inv;  // Armazenando o inventário na variável global.placar

if (point_distance(x, y, OPlayer.x, OPlayer.y) <= hitbox_range) {
    if (keyboard_check_pressed(ord("E"))) {
        var total_coins = 0;

        for (var i = array_length(global.inv) - 1; i >= 0; i--) {
            var item = global.inv[i];
            total_coins += item.count;
            array_delete(global.inv, i, 1);
        }

        global.coin += total_coins;
		 instance_create_layer(430, 200, "instances", Obadge);
    }
}
