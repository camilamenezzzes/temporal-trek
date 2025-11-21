if (move_checkpoint == false)
{
    velh = 0;
    velv = 0;
    
    // Reduzir uma vida
    global.life--;
    
    // Reproduzir som de hit
    audio_play_sound(snd_hit, 2, false);
    
    // Mudar sprite para a animação de "morte"
    muda_sprite(spr_player_die);
    
    // Marcar o checkpoint de hit
    move_checkpoint = true;
    
    // Ativar o efeito de "screenshake"
    screenshake(5);

    // Verificar se as vidas acabaram
    if (global.life <= 0 && global.game_over == false)
    {
		
        var _cam_x = camera_get_view_x(view_camera[0]);
        var _cam_y = camera_get_view_y(view_camera[0]);

        // Parar a música da sala
        audio_stop_sound(snd_music_fase); // Substitua 'snd_music_fase' pelo nome correto da música.

        // Exibir a animação de "morreu"
        layer_sequence_create("Sequence", _cam_x, _cam_y, sq_morreu);
        global.game_over = true;

        // Zerar o contador de morangos
        global.morangos = 0;

        // Configurar o tempo para ir para a sala de Game Over
        alarm[1] = room_speed * 4; // 4 segundos de espera
    }
}
