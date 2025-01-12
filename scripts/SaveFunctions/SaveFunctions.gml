// Função para salvar os dados da fase atual
function save_room() { 
    var _itemNum = instance_number(Object_ingame_pop);
	var _itemNum1 = instance_number(Opop);
	var _itemNum2 = instance_number(Otrash);
	var _itemNum3 = instance_number(Orust1);
	var _itemNum4 = instance_number(Orust2);
	var _itemNum5 = instance_number(Orust3);
    var _coinNum = instance_number(Ocoin); 

    // Criar estrutura para salvar os dados da fase
    var _roomStruct = { 
        coinNum : _coinNum, 
        coindata : array_create(_coinNum), 
        itemNum : _itemNum,
		itemNum1 : _itemNum1,
		itemNum2 : _itemNum2,
		itemNum3 : _itemNum3,
		itemNum4 : _itemNum4,
		itemNum5 : _itemNum5,
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

	 // Salvar dados dos itens
    for (var i = 0; i < _itemNum1; i++) {
        var _inst = instance_find(Opop, i);
        _roomStruct.itemdata[i] = {
            x : _inst.x, 
            y : _inst.y, 
        };
    }
	
	 // Salvar dados dos itens
    for (var i = 0; i < _itemNum2; i++) {
        var _inst = instance_find(Otrash, i);
        _roomStruct.itemdata[i] = {
            x : _inst.x, 
            y : _inst.y, 
        };
    }
	
	 // Salvar dados dos itens
    for (var i = 0; i < _itemNum3; i++) {
        var _inst = instance_find(Orust1, i);
        _roomStruct.itemdata[i] = {
            x : _inst.x, 
            y : _inst.y, 
        };
    }

	 // Salvar dados dos itens
    for (var i = 0; i < _itemNum3; i++) {
        var _inst = instance_find(Orust2, i);
        _roomStruct.itemdata[i] = {
            x : _inst.x, 
            y : _inst.y, 
        };
    }

// Salvar dados dos itens
    for (var i = 0; i < _itemNum3; i++) {
        var _inst = instance_find(Orust3, i);
        _roomStruct.itemdata[i] = {
            x : _inst.x, 
            y : _inst.y, 
        };
    }

    // Guardar dados no struct global correspondente à fase
    if (room == Green_valley)        { global.leveldata.level_1 = _roomStruct; }
    if (room == Green_valley_2)      { global.leveldata.level_2 = _roomStruct; }
    if (room == Green_valley_9)      { global.leveldata.level_3 = _roomStruct; }
    if (room == Green_valley_4)      { global.leveldata.level_4 = _roomStruct; }
    if (room == Green_valley_5)      { global.leveldata.level_5 = _roomStruct; }
    if (room == Green_valley_6)      { global.leveldata.level_6 = _roomStruct; }
    if (room == Green_valley_7)      { global.leveldata.level_7 = _roomStruct; }
    if (room == Green_valley_8)      { global.leveldata.level_8 = _roomStruct; }
    if (room == Green_valley_3)      { global.leveldata.level_9 = _roomStruct; }
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
	
	// Recriar os itens na fase
    if (instance_exists(Opop)) { instance_destroy(Opop); }
    for (var i = 0; i < _roomStruct.itemNum1; i++) {
        instance_create_depth(_roomStruct.itemdata[i].x, _roomStruct.itemdata[i].y, layer, Opop);
    }
	
	// Recriar os itens na fase
    if (instance_exists(Otrash)) { instance_destroy(Otrash); }
    for (var i = 0; i < _roomStruct.itemNum2; i++) {
        instance_create_depth(_roomStruct.itemdata[i].x, _roomStruct.itemdata[i].y, layer, Otrash);
    }
	
		// Recriar os itens na fase
    if (instance_exists(Orust1)) { instance_destroy(Orust1); }
    for (var i = 0; i < _roomStruct.itemNum3; i++) {
        instance_create_depth(_roomStruct.itemdata[i].x, _roomStruct.itemdata[i].y, layer, Orust1);
    }
	
		// Recriar os itens na fase
    if (instance_exists(Orust2)) { instance_destroy(Orust2); }
    for (var i = 0; i < _roomStruct.itemNum4; i++) {
        instance_create_depth(_roomStruct.itemdata[i].x, _roomStruct.itemdata[i].y, layer, Orust2);
    }
	
		// Recriar os itens na fase
    if (instance_exists(Orust3)) { instance_destroy(Orust3); }
    for (var i = 0; i < _roomStruct.itemNum5; i++) {
        instance_create_depth(_roomStruct.itemdata[i].x, _roomStruct.itemdata[i].y, layer, Orust3);
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
	global.base = _json
show_debug_message("Pontos salvos: " + string(global.point));
show_debug_message("JSON para salvar: " + _json);

	
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
	show_debug_message("Pontos carregados: " + string(global.savedata.point));

}



//
//function post_database() {
//    // Estruturar os dados salvos
//    save_game(); // Certifique-se de salvar os dados antes de postar
//
//    var _json = json_stringify({
//        "fields": {
//            "player_position": {
//                "mapValue": {
//                    "fields": {
//                        "x": { "integerValue": global.savedata.save_x },
//                        "y": { "integerValue": global.savedata.save_y },
//                    }
//                }
//            },
//            "room_name": { "stringValue": global.savedata.save_rm },
//            "coins_collected": { "integerValue": global.savedata.coins },
//            "points": { "integerValue": global.savedata.point },
//            "inventory": {
//                "arrayValue": {
//                    "values": array_map(global.savedata.item_inv, function(item) {
//                        return { "stringValue": item }; // Adapte se os itens forem mais complexos
//                    })
//                }
//            },
//            "levels_data": {
//                "mapValue": {
//                    "fields": {
//                        "level_1": { "stringValue": json_stringify(global.leveldata.level_1) },
//                        "level_2": { "stringValue": json_stringify(global.leveldata.level_2) },
//                        // Continue para os outros níveis...
//                    }
//                }
//            }
//        }
//    });
//
//    // Configurar URL do Firestore
//    var projeto_id = "dadosdopato"; // Substitua pelo ID do seu projeto Firebase
//    var colecao = "dados"; // Nome da coleção
//    var documento = "pKZRvldJpckyEg1ktS1m"; // Nome único do documento
//    var _url = "https://firestore.googleapis.com/v1/projects/" + projeto_id + "/databases/(default)/documents/" + colecao + "/" + documento;
//
//    // Configurar cabeçalhos para a requisição
//    var _headers = ds_map_create();
//    _headers[? "Content-Type"] = "application/json";
//
//    // Enviar o JSON para o Firestore
//    global.http_request_id = http_request(_url, "PATCH", _headers, _json);
//
//    // Limpar cabeçalhos após o envio
//    ds_map_destroy(_headers);
//
//    show_debug_message("Requisição enviada para Firestore...");
//}
//