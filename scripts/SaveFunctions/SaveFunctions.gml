// Função para salvar os dados da fase atual
function save_room() { 
    var _itemNum = instance_number(Object_ingame_pop);
    var _coinNum = instance_number(Ocoin); 

    // Criar estrutura para salvar os dados da fase
    var _roomStruct = { 
        coinNum : _coinNum, 
        coindata : array_create(_coinNum), 
        itemNum : _itemNum,
        itemdata : array_create(_itemNum),
    };

    // Salvar dados das moedas
    for (var i = 0; i < _coinNum; i++) { 
        var _inst = instance_find(Ocoin, i); 
        _roomStruct.coindata[i] = { 
            x : _inst.x, 
            y : _inst.y, 
        }; 
    }

    // Salvar dados dos itens
    for (var i = 0; i < _itemNum; i++) {
        var _inst = instance_find(Object_ingame_pop, i);
        _roomStruct.itemdata[i] = {
            x : _inst.x, 
            y : _inst.y, 
        };
    }

    // Guardar dados no struct global correspondente à fase
    if (room == Green_valley)        { global.leveldata.level_1 = _roomStruct; }
    if (room == Green_valley_2)      { global.leveldata.level_2 = _roomStruct; }
    if (room == Green_valley_3)      { global.leveldata.level_3 = _roomStruct; }
    if (room == Green_valley_4)      { global.leveldata.level_4 = _roomStruct; }
    if (room == Green_valley_5)      { global.leveldata.level_5 = _roomStruct; }
    if (room == Green_valley_6)      { global.leveldata.level_6 = _roomStruct; }
    if (room == Green_valley_7)      { global.leveldata.level_7 = _roomStruct; }
    if (room == Green_valley_8)      { global.leveldata.level_8 = _roomStruct; }
    if (room == Green_valley_9)      { global.leveldata.level_9 = _roomStruct; }
}

// Função para carregar os dados da fase atual
function load_room() { 
    var _roomStruct = 0;

    // Obter os dados da fase correspondente
if (room == Green_valley)        { _roomStruct = global.leveldata.level_1; }
if (room == Green_valley_2)      { _roomStruct = global.leveldata.level_2; }
if (room == Green_valley_3)      { _roomStruct = global.leveldata.level_3; }
if (room == Green_valley_4)      { _roomStruct = global.leveldata.level_4; }
if (room == Green_valley_5)      { _roomStruct = global.leveldata.level_5; }
if (room == Green_valley_6)      { _roomStruct = global.leveldata.level_6; }
if (room == Green_valley_7)      { _roomStruct = global.leveldata.level_7; }
if (room == Green_valley_8)      { _roomStruct = global.leveldata.level_8; }
if (room == Green_valley_9)      { _roomStruct = global.leveldata.level_9; }

    // Parar se _roomStruct não for uma struct válida
    if (!is_struct(_roomStruct)) { exit; }

    // Recriar as moedas na fase
    if (instance_exists(Ocoin)) { instance_destroy(Ocoin); }
    for (var i = 0; i < _roomStruct.coinNum; i++) { 
        instance_create_depth(_roomStruct.coindata[i].x, _roomStruct.coindata[i].y, layer, Ocoin);  
    }

    // Recriar os itens na fase
    if (instance_exists(Object_ingame_pop)) { instance_destroy(Object_ingame_pop); }
    for (var i = 0; i < _roomStruct.itemNum; i++) {
        instance_create_depth(_roomStruct.itemdata[i].x, _roomStruct.itemdata[i].y, layer, Object_ingame_pop);
    }
}

// Função para salvar o jogo
function save_game() {
    var _savearray = array_create(0);

    // Salvar dados da fase atual
    save_room();

    // Salvar dados do jogador e inventário
    global.savedata.save_x = OPlayer.x;
    global.savedata.save_y = OPlayer.y;
    global.savedata.save_rm = room_get_name(room);
    global.savedata.coins = global.coin;
    global.savedata.point = global.point;
    global.savedata.item_inv = global.inv; // Salvando inventário como está

    // Adicionar dados ao array de salvamento
    array_push(_savearray, global.savedata);
    array_push(_savearray, global.leveldata);

    // Converter dados para JSON e salvar em arquivo
    var _filename = "savedata.sav";
    var _json = json_stringify(_savearray);
    var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _json);
    buffer_save(_buffer, _filename);
    buffer_delete(_buffer);
}

// Função para carregar o jogo
function load_game() {
    var _filename = "savedata.sav";

    // Verificar se o arquivo de salvamento existe
    if (!file_exists(_filename)) { exit; }

    // Carregar os dados do arquivo
    var _buffer = buffer_load(_filename);
    var _json = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);

    // Converter JSON para array e carregar dados globais
    var _load_array = json_parse(_json);
    global.savedata = array_get(_load_array,  0);
    global.leveldata = array_get(_load_array, 1);

    // Restaurar dados do jogador
    global.coin = global.savedata.coins;
    global.point = global.savedata.point;
    global.inv = global.savedata.item_inv;

    // Mover para a sala salva
    var _load_room = asset_get_index(global.savedata.save_rm);
    room_goto(_load_room);

    // Recriar o jogador na posição salva
    if (instance_exists(OPlayer)) { instance_destroy(OPlayer); }
    instance_create_depth(global.savedata.save_x, global.savedata.save_y, layer, OPlayer);

    // Carregar os dados da sala
    load_room();
}
