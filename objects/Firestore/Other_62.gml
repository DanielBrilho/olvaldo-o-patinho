
// Função para tratar resposta do Firestore
function assinc() {
    if (!ds_map_exists(async_load, "id") || async_load[? "id"] != global.http_request_id) {
        return;
    }
    
    var status = async_load[? "status"];
    var statusString = string(status);
    
    show_debug_message("Firestore Response Status: " + statusString);
    
    if (status == 200 || status == 0) {
        show_debug_message("JSON enviado com sucesso ao Firestore!");
        
        if (ds_map_exists(async_load, "result")) {
            var response = async_load[? "result"];
            show_debug_message("Resposta do Firestore: " + string(response));
            
            try {
                var parsedResponse = json_parse(response);
                show_debug_message("Dados salvos com ID: " + string(parsedResponse.name));
            } catch (e) {
                show_debug_message("Aviso: Não foi possível analisar a resposta JSON");
            }
        }
    } else {
        show_debug_message("Erro ao enviar JSON: " + statusString);
        
        if (ds_map_exists(async_load, "http_response")) {
            var errorResponse = async_load[? "http_response"];
            show_debug_message("Erro detalhado: " + string(errorResponse));
            
            try {
                var parsedError = json_parse(errorResponse);
                if (variable_struct_exists(parsedError, "error")) {
                    show_debug_message("Código de erro: " + string(parsedError.error.code));
                    show_debug_message("Mensagem de erro: " + string(parsedError.error.message));
                }
            } catch (e) {
                show_debug_message("Erro bruto: " + string(errorResponse));
            }
        }
        
        if (status == -1) {
            show_debug_message("Timeout na conexão com o Firestore");
        }
    }
}