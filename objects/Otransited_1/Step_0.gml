
var hitbox_range = 70;  // Ajuste esse valor conforme necessário

// Verificar se o jogador está dentro da hitbox do objeto
if (point_distance(x, y, OPlayer.x, OPlayer.y) <= hitbox_range) {
   if(keyboard_check(ord("E"))) {
	room_goto(targetRoom)

OPlayer.x = targetX;
OPlayer.y = targetY;	
   }
}
