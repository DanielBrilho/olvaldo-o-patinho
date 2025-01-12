var hitbox_range = 50;  // Ajuste esse valor conforme necessário

// Verificar se o jogador está dentro da hitbox do objeto
if (point_distance(x, y, OPlayer.x, OPlayer.y) <= hitbox_range) {
   if(keyboard_check(vk_up)) {
	OPlayer.y += -2

}
}