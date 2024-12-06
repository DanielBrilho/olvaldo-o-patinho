depth = -9999;

// criar item
function create_item(_name, _description, _sprite, _count) constructor {
    name = _name;
    description = _description;
    sprite = _sprite;
    count = _count;
}

// lista items
global.itemlist = {
    trash_small: new create_item(
        "lixo",
        "É um saco de lixo, colete ele para limpar o ambiente e receber pontos",
        Ssmall_trash,
        1
    ),
   lollypop: new create_item(
        "Doces:",
        "é um chupa, ele te dá pontos e é bem docinho.",
        Schupa,
        1
    )
};

// inventario:
global.inv = array_create(0);



// variaveis de posicao
esp = 50;
borda = 50;
sep = 50;








if (!variable_global_exists("itemlist")) {
    show_error("A variável global 'itemlist' não foi inicializada antes de acessar.", true);
}

if (!is_struct(global.itemlist)) {
    show_error("A variável global 'itemlist' não é uma estrutura válida.", true);
}

if (!variable_struct_exists(global.itemlist, "lollypop")) {
    show_error("A propriedade 'lollypop' não foi definida na estrutura 'itemlist'.", true);
}

item = global.itemlist.lollypop;
