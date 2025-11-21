if (index == 0) {
    // Vai para a próxima room (Primeira fase, ou outro que você definir)
    room_goto_next();
} else if (index == 1) {
    // Vai para a sala de Opções
    room_goto(room_opcoes);  // Certifique-se de que a room "room_opcoes" existe
} else if (index == 2) {
    // Vai para a sala de Créditos
    room_goto(room_creditos);  // Certifique-se de que a room "room_creditos" existe
} else if (index == 3) {
    // Encerra o jogo
    game_end();
}
