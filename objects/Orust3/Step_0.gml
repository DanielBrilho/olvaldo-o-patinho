sprite_index = item.sprite
sprite_index = item.sprite


var hitbox_range = 50;  // Ajuste esse valor conforme necessário

// Verificar se o jogador está dentro da hitbox do objeto
if (point_distance(x, y, OPlayer.x, OPlayer.y) <= hitbox_range) {
   if(keyboard_check(ord("E"))) {
	item_add(item);
	//post_database()
	global.coin += 1;
	global.point += 50;
	instance_destroy()
audio_play_sound(SoundCollect_trash,0,false)
}
}