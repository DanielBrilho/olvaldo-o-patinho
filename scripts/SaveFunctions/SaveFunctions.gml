function save_room() 
{ 
	
	
    var _coinNum = instance_number(Ocoin); 
	
    var _roomStruct =  
    { 
		
		
        coinNum : _coinNum, 
        coindata : array_create(_coinNum), 
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

    // Guardar os dados da fase específica em um struct global específico para aquela fase
    if (room == Green_valley) { global.leveldata.level_1 = _roomStruct; }
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
	
	
	
}

