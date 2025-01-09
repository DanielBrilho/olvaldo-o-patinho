//function post_database() {
//	
//    // JSON já preparado como string
//  var _json = json_stringify({
//    "fields": {
//        "score": { "integerValue": 100 },
//        "level": { "integerValue": 5 },
//        "player_name": { "stringValue": "John Doe" }
//    }
//});
//    // Configurar URL do Firestore
//    var projeto_id = "dadosdopato"; // Substitua pelo ID do seu projeto Firebase
//    var colecao = "dados"; // Nome da coleção
//    var documento = "pKZRvldJpckyEg1ktS1m"; // Nome único do documento
//    var _url = "https://firestore.googleapis.com/v1/projects/" + projeto_id + "/databases/(default)/documents/" + colecao + "/" + documento;
//	show_debug_message(_url);
//
//    // Configurar cabeçalhos para a requisição
//    var _headers = ds_map_create();
//    _headers[? "Content-Type"] = "application/json"; // Formato do corpo da requisição
//show_debug_message("enviando");
//
//    // Enviar o JSON para o Firestore e armazenar o ID da requisição
//    global.http_request_id = http_request(_url, "PATCH", _headers, _json);
//
//    // Limpar cabeçalhos após o envio
//    ds_map_destroy(_headers);
//
//    show_debug_message("Requisição enviada para Firestore...");
//
//}
//
//function sayhello(){show_debug_message("Sua mensagem aqui!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//}