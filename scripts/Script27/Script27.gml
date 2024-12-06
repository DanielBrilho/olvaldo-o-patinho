function item_add(_item) {
    for (var i = 0; i < array_length(global.inv); i++) {
        if (global.inv[i].name == item.name) {
            // Incrementa a contagem do item
            global.inv[i].count += 1;
            return;
        }
    }

    // Caso o item não exista, adicione-o ao inventário
    array_push(global.inv, item);
}
