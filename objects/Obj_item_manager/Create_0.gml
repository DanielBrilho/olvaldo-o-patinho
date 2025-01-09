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
	//lixos____________________________________________________________________
    trash_small: new create_item(
        "lixo",
        "É um saco de lixo, colete ele para limpar o ambiente e receber pontos",
        Ssmall_trash,
        1
    ),
	//doces____________________________________________________________________
   lollypop: new create_item(
        "Doces:",
        "é um chupa, ele te dá pontos e é bem docinho.",
        Schupa,
        1
    ),
	//ferrugens________________________________________________________________
	rust: new create_item(
	"ferrugem",
	"pedaço de metal enferrujado",
	Soxyd1,
	1
	),
	rust2: new create_item(
	"ferrugem",
	"pedaço de metal enferrujado",
	Soxyd2,
	1
	),
	rust3: new create_item(
	"ferrugem",
	"pedaço de metal enferrujado",
	Soxyd3,
	1
	),
	//tesouros
};

// inventario:
global.inv = array_create(0);



// variaveis de posicao
esp = 50;
borda = 50;
sep = 50;
max_height = 300;
col_width = 100;


global.xpos =0;
global.ypos =0;




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
