
var hitbox_range = 70;  // Ajuste esse valor conforme necessário

// Verificar se o jogador está dentro da hitbox do objeto
if (point_distance(x, y, OPlayer.x, OPlayer.y) <= hitbox_range) {
   if(keyboard_check(ord("E"))) {
	
	 instance_create_layer(170, 70, "instances", Obgtext_asset_2);
	 instance_create_layer(132, 110, "instances", Onext_asse_1);

}
	if keyboard_check(ord("R")){
	instance_destroy(Obgtext_asset_2);
	instance_destroy(Onext_asse_1);
	instance_destroy(Onext_asse_2);
	instance_destroy(Onext_asse_3);
	instance_destroy(Onext_asse_4);
	}
}