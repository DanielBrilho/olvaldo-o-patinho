
var hitbox_range = 100;  // Ajuste esse valor conforme necessário

// Verificar se o jogador está dentro da hitbox do objeto
if (point_distance(x, y, OPlayer.x, OPlayer.y) <= hitbox_range) {
   if(keyboard_check(ord("E"))) {
	
	 instance_create_layer(150, 70, "instances", Obgtext_3);
	 instance_create_layer(132, 110, "instances", Onext_01);

}
	if keyboard_check(ord("R")){
	instance_destroy(Obgtext_3);
	instance_destroy(Onext_01);
	instance_destroy(Onext_02);
	instance_destroy(Onext__3);
	instance_destroy(Onext_04);
	}
}