// Converter as coordenadas do mouse para o espaço GUI
var mouse_x_gui = device_mouse_x_to_gui(0);
var mouse_y_gui = device_mouse_y_to_gui(0);

// Detecção do clique no botão "Iniciar Jogo"
if (mouse_x_gui >= botao_inicio.x && mouse_x_gui <= botao_inicio.x + botao_inicio.largura &&
    mouse_y_gui >= botao_inicio.y && mouse_y_gui <= botao_inicio.y + botao_inicio.altura)
{
    show_debug_message("Botão 'Iniciar Jogo' pressionado!");
    room_goto(FaseEmPlataforma);  // Mudar para a fase desejada
}

// Detecção do clique no botão "Opções"
if (mouse_x_gui >= botao_opcoes.x && mouse_x_gui <= botao_opcoes.x + botao_opcoes.largura &&
    mouse_y_gui >= botao_opcoes.y && mouse_y_gui <= botao_opcoes.y + botao_opcoes.altura)
{
    show_debug_message("Botão 'Opções' pressionado!");
    room_goto(room_opcoes);  // Mudar para a sala de opções
}

// Detecção do clique no botão "Créditos"
if (mouse_x_gui >= botao_creditos.x && mouse_x_gui <= botao_creditos.x + botao_creditos.largura &&
    mouse_y_gui >= botao_creditos.y && mouse_y_gui <= botao_creditos.y + botao_creditos.altura)
{
    show_debug_message("Botão 'Créditos' pressionado!");
    room_goto(room_creditos);  // Mudar para a sala de créditos
}

// Detecção do clique no botão "Sair"
if (mouse_x_gui >= botao_sair.x && mouse_x_gui <= botao_sair.x + botao_sair.largura &&
    mouse_y_gui >= botao_sair.y && mouse_y_gui <= botao_sair.y + botao_sair.altura)
{
    show_debug_message("Botão 'Sair' pressionado!");
    game_end();  // Fechar o jogo
}
