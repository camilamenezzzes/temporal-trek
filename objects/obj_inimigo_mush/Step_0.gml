/// @description Lógica de movimentação do inimigo

// Verifica se existe a instância "mus_hit" e atualiza sua posição
if (instance_exists(mus_hit)) {
    mus_hit.x = x;
    mus_hit.y = y - 4;
}

// Verifica se o inimigo morreu
if (inimigo_morto) {
    instance_destroy(mus_hit);

    if (image_index >= image_number - 1) {
        instance_destroy();
    }
    exit;
}

// Verificações de colisão
var _chao = place_meeting(x, y + 1, Obj_Bloco); // Verifica se o inimigo está no chão
var _parede = place_meeting(x + velh, y, Obj_Bloco); // Verifica se há uma parede na frente
var _xDirection = velh * -1; // Direção horizontal do movimento

// Atualiza a escala horizontal da imagem baseado na direção
if (_xDirection != 0) {
    if (_xDirection >= 1) {
        image_xscale = 1;
    } else if (_xDirection <= -1) {
        image_xscale = -1;
    }
}

// Lógica quando o inimigo está no chão
if (_chao) {
    tempo_decidir_andar -= 1;

    // Alterna entre andar/parar após um tempo
    if (tempo_decidir_andar <= 0) {
        if (andando) {
            virar_inimigo = true;
            velh = velocidade;
            andando = false;
        } else {
            velh = 0;

            if (virar_inimigo) {
                velocidade *= -1; // Inverte a direção
                virar_inimigo = false;
            }

            andando = true;
        }

        tempo_decidir_andar = room_speed * 2; // Reseta o tempo para a próxima decisão
    }

    // Atualiza o sprite baseado na ação
    if (velh != 0 && !levou_dano) {
        sprite_index = spr_mush_run;
    } else {
        if (image_index >= image_number - 1) {
            sprite_index = spr_mush_parado;
        }
    }

    // Verifica se há uma parede e inverte a direção
    if (_parede) {
        velh *= -1;
    }

    // Nova verificação para evitar quedas em buracos
    if (!place_meeting(x + sign(velh) * 10, y + 1, Obj_Bloco)) {
        velh *= -1; // Inverte a direção se não houver chão à frente
    }
} else {
    // Lógica para quando o inimigo não está no chão
    velh = 0;
    velv += gravidade; // Adiciona gravidade
}

// Lógica de dano e morte do inimigo
if (levou_dano && !invencivel) {
    invencivel = true;
    velh = 0;
    inimigo_vida--;

    if (inimigo_vida <= 0) {
        inimigo_morto = true;
        muda_sprite(spr_inimigo_die);
    } else {
        alarm[0] = room_speed; // Configura o tempo de invencibilidade
        sprite_index = spr_mush_hit;
    }
}
