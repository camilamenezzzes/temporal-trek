// Evento de Tecla Pressionada para reiniciar ou sair

if (keyboard_check_pressed(ord("R"))) {
    // Resetar as variáveis de vidas, morangos e outros valores importantes
    global.life = 3; // Reinicia as vidas
    global.morangos = 0; // Zera o contador de morangos

    // Reiniciar o status do jogador e quaisquer variáveis relacionada
    global.game_over = false; // Desmarcar o estado de "game over"

    // Vai para a sala de Fase
    room_goto(FaseEmPlataforma); // Sala de reinício
} 
else if (keyboard_check_pressed(ord("Q"))) {
    // Vai para o menu principal
    room_goto(Menu); // Vai para a sala de menu
}
