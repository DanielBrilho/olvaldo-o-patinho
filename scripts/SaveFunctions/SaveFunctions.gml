function save_room() 
{ 
	
	var _itemNum = instance_number(Object_ingame_pop);
    var _coinNum = instance_number(Ocoin); 
	
    var _roomStruct =  
    { 
		
		
        coinNum : _coinNum, 
        coindata : array_create(_coinNum), 
		itemNum : _itemNum,
		itemdata : array_create(_itemNum),
    };

	
    

    // Ler os dados dos objetos que a gente vai querer salvar - Moedas
    for (var i = 0; i < _coinNum; i++) 
    { 
        var _inst = instance_find(Ocoin, i); 
        _roomStruct.coindata[i] = 
        { 
            x : _inst.x, 
            y : _inst.y, 
        }; 
    }

	for(var i = 0;i < _itemNum; i++)
	{
		var _inst = instance_find(Object_ingame_pop, i);
		_roomStruct.itemdata[i] =
		{
		    x : _inst.x, 
            y : _inst.y, 
		};
	}

    // Guardar os dados da fase específica em um struct global específico para aquela fase
    if (room == Green_valley)   { global.leveldata.level_1 = _roomStruct; }
    if (room == Green_valley_2) { global.leveldata.level_2 = _roomStruct; }
    if (room == Green_valley_3) { global.leveldata.level_3 = _roomStruct; }
}

function load_room() 
{ 
    var _roomStruct = 0;

   if (room == Green_valley) { _roomStruct = global.leveldata.level_1; }
    if (room == Green_valley_2) { _roomStruct = global.leveldata.level_2; }
    if (room == Green_valley_3) { _roomStruct = global.leveldata.level_3; }

    // Parar se _roomStruct não for uma struct
    if (!is_struct(_roomStruct)) { exit; }

    // Fazer as moedas sumirem para depois spawnar apenas aquelas que ainda não foram coletadas
    if (instance_exists(Ocoin)) { instance_destroy(Ocoin); }

    for (var i = 0; i < _roomStruct.coinNum; i++) 
    { 
        instance_create_depth(_roomStruct.coindata[i].x, _roomStruct.coindata[i].y, layer, Ocoin);  
    }
	
	if (instance_exists(Object_ingame_pop)) {instance_destroy(Object_ingame_pop);}
	
	for(var i = 0; i < _roomStruct.itemNum; i++)
	{
		instance_create_depth(_roomStruct.itemdata[i].x,_roomStruct.itemdata[i].y, layer, Object_ingame_pop);
	}
	
}

function save_game()
{
	var _savearray = array_create(0);
	
	save_room()
	
	global.savedata.save_x = OPlayer.x;
	global.savedata.save_y = OPlayer.y;
	global.savedata.save_rm = room_get_name(room);
	
	global.savedata.coins = global.coin;
	global.savedata.point = global.point;
	global.savedata.item_inv = global.item_inv;
	
	array_push(_savearray, global.savedata);
	array_push(_savearray, global.leveldata);
	
	var _filename ="savedata.sav"
	var _json = json_stringify(_savearray);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed,1 );
	buffer_write(_buffer,buffer_string,_json);
	
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);

	
}

function load_game()
{
	var _filename = "savedata.sav";
	if !file_exists(_filename) exit;
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	
	
	var _load_array = json_parse(_json);
	
	
	global.savedata = array_get(_load_array, 0);
	global.leveldata = array_get(_load_array,1);
	global.coin = global.savedata.coins;
	global.item_inv = global.savedata.item_inv;
	
	
	var _load_room = asset_get_index(global.savedata.save_rm);
	room_goto(_load_room);
	
	if instance_exists(OPlayer) {instance_destroy(OPlayer);}
	instance_create_depth(global.savedata.save_x,global.savedata.save_y,layer,OPlayer);
	
	load_room();
	
}