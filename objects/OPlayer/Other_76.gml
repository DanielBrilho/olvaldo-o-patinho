/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if event_data[? "event_type"] == "sequence event" // or you can check "sprite event"
{
    switch (event_data[? "message"])
    {
        case "walk":
            audio_play_sound(Soudwalk, 0, false);
        break;

       
    }
}