if (keyboard_check(ord("A"))) {
    // Certifique-se de que global.inv foi inicializado
    if (!is_array(global.inv)) {
        show_error("O inventário global 'inv' não foi inicializado.", true);
    }

    for (var i = 0; i < array_length(global.inv); i++) {
        var _xx = esp;
        var _yy = borda;
        var _sep = sep;

        // Desenha o sprite do item
        draw_sprite(global.inv[i].sprite, 0, _xx, _yy + _sep * i);

        // Desenha o contador
        draw_text(_xx, _yy + _sep * i, string(global.inv[i].count));

        // Desenha o nome do item
        draw_text(_xx + 25, _yy - 10 + _sep * i, global.inv[i].name);
    }
}
