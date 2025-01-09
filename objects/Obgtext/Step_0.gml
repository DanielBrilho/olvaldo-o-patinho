// Suponha que você tenha 5 frames no sprite (0 a 4)
// E cada frame é associado a uma faixa de pontos

if (global.point >= 800 && global.point < 1000) {
    image_index = 0; // Primeiro frame
} else if (global.point >= 1000 && global.point < 1200) {
    image_index = 1; // Segundo frame
} else if (global.point >= 1200 && global.point < 1400) {
    image_index = 2; // Terceiro frame
} else if (global.point >= 1400 && global.point < 1500) {
    image_index = 3; // Quarto frame
} else if (global.point >= 1600) {
    image_index = 4; // Quinto frame
}
