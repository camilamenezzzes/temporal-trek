// Navegação pelas opções com as setas para cima/baixo
if (keyboard_check_pressed(vk_up)) {
    opcao_selecionada = max(0, opcao_selecionada - 1);  // Vai para a opção anterior
} else if (keyboard_check_pressed(vk_down)) {
    opcao_selecionada = min(2, opcao_selecionada + 1);  // Vai para a próxima opção (2 opções no total)
}

// Ajustar volume de música
if (keyboard_check_pressed(vk_left) && opcao_selecionada == 0) {
    volume_music = max(0, volume_music - 0.1); // Diminui o volume da música
    audio_music_set_volume(volume_music);
}

// Ajustar volume de efeitos sonoros
if (keyboard_check_pressed(vk_left) && opcao_selecionada == 1) {
    volume_sfx = max(0, volume_sfx - 0.1); // Diminui o volume dos efeitos sonoros
    audio_set_sfx_volume(volume_sfx);
}

// Aumentar volume de música
if (keyboard_check_pressed(vk_right) && opcao_selecionada == 0) {
    volume_music = min(1, volume_music + 0.1); // Aumenta o volume da música
    audio_music_set_volume(volume_music);
}

// Aumentar volume de efeitos sonoros
if (keyboard_check_pressed(vk_right) && opcao_selecionada == 1) {
    volume_sfx = min(1, volume_sfx + 0.1); // Aumenta o volume dos efeitos sonoros
    audio_set_sfx_volume(volume_sfx);
}

// Alternar entre modo Tela Cheia e Janela
if (keyboard_check_pressed(vk_right) && opcao_selecionada == 2) {
    if (display_is_fullscreen()) {
        display_set_fullscreen(false);  // Desativa o modo tela cheia
    } else {
        display_set_fullscreen(true);   // Ativa o modo tela cheia
    }
}

// Se o Enter for pressionado, volta para o menu principal
if (keyboard_check_pressed(vk_enter)) {
    room_goto(room_menu); // Vai para o menu principal (ou onde você deseja retornar)
}
