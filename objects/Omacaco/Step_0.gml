
var hitbox_range = 50;  // Ajuste esse valor conforme necessário

// Verificar se o jogador está dentro da hitbox do objeto
if (point_distance(x, y, OPlayer.x, OPlayer.y) <= hitbox_range) {
   if(keyboard_check(ord("E"))) {
	
	 instance_create_layer(206, 122, "instances", Obgtext);
	if global.point >= 1600{
	instance_create_layer(224, 250, "instances",Obanana );
	//}


   }
}
}