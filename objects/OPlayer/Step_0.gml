/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Andar


if keyboard_check(vk_left)
{
 x-=1

}
if keyboard_check(vk_right)
{
 x+=1
  
}


//Animação
// Animação (corrected key checks)
if keyboard_check(vk_left) || keyboard_check(vk_right)
{
    sprite_index = SplayerWalk;
}
else
{
    sprite_index = SPlayerIdle;
}



//Direção
if keyboard_check(vk_right)
{
image_xscale=-1
}

if keyboard_check(vk_left)
{
image_xscale=1
}
//gravidade e pulo








if place_free(x,y+1)

{y += 1
	
	}

else
{
	y += 0
if keyboard_check(vk_space)
{
	audio_play_sound(Soudjump,0,false)
  for(pulo=0 ;pulo <= 5; pulo++)
   {
 y += -5;
   } 
 }
}







