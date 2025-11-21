event_inherited();

// variáveis de movimento e gravidade
velocidade = 5;
gravidade = .3;
forca_pulo = -7;
global.life = 3; 

qtd_pulos = 0;
max_pulos = 2;
sprite_run= spr_astronauta_Run;
sprite_idle = spr_astronauta_Idle;
sprite_wall_jump= spr_astronauta_Wall_Jump;
sprite_jump = spr_astronauta_Jump;
sprite_double_jump = spr_astronauta_Double_Jump;
sprite_fall = spr_astronauta_Fall;

move_checkpoint = false;

dano = false;
tempo_dano = room_speed * 1;
timer_dano = 0;


function input_player() {
    var _left, _right, _jump, _xDirection;

	_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	_left  = keyboard_check(vk_left)  or keyboard_check(ord("A"));

	
    _jump = keyboard_check_pressed(vk_space);

	_xDirection = _right - _left;
	
    var _velh = (_right - _left) * velocidade;

    var _no_chao = place_meeting(x, y+1, Obj_Bloco);
	var _na_parede = place_meeting(x+(_xDirection),y, Obj_Bloco);
	
if (timer_dano){
	velh = (_right - _left) * velocidade;
}
	
	
	if(_xDirection != 0){
		image_xscale = _xDirection;
	}
	
	
    if (_no_chao) {
		
			if(_xDirection != 0){
			sprite_index = sprite_run;
		}
		else{
			sprite_index = sprite_idle;
		}
	}
	else if(_na_parede)
	{
		sprite_index = sprite_wall_jump;
	}
	else {
    // Se o personagem está no ar, ele estará no estado de "fall"
    if (qtd_pulos == (max_pulos - 1)) {
        sprite_index = sprite_jump;
    } else {
        sprite_index = sprite_double_jump;
    }

    // Se o personagem está caindo e ainda tem pulos disponíveis
    if (velv > 0) {
        var _inimigo = instance_place(x, y, obj_Inimigo_pai);
        if (_inimigo) {
            _inimigo.levou_dano = true;
            velv = forca_pulo;
        }
        sprite_index = sprite_fall;

        // Permitir double jump se ele ainda tiver pulos restantes enquanto está caindo
        if (_jump && qtd_pulos > 0) {
            velv = forca_pulo;
            qtd_pulos--; // Decrementa a quantidade de pulos
            audio_play_sound(snd_cartoon_jump, 2, false);
        }
    }
}

	
	
	if(_no_chao)
	{
		qtd_pulos = max_pulos;
        if (_jump) {
            velv = forca_pulo;
			qtd_pulos--;
			audio_play_sound(snd_cartoon_jump,2,false)
        }
		
    } 
	else {
			
		if(_jump && qtd_pulos == 1){
			velv = forca_pulo;
			qtd_pulos--;
			audio_play_sound(snd_cartoon_jump,2,false)
		}
		
		
		//código do wall jump 
		if(_na_parede){
			velv =1;
			
			if(_jump){
				velv = forca_pulo;
				velh = (10* _xDirection) *-1;
				audio_play_sound(snd_cartoon_jump,2,false)
			}
		}
    }

// Aplica a gravidade sempre que o personagem não está no chão
    if(!_no_chao && !_na_parede) { // Opcional, mas mais limpo: só aplica gravidade quando realmente está no ar.
         velv += gravidade;
    } 
    // Se quiser aplicar sempre, coloque fora do if(!_no_chao) e resolva as colisões depois.
    
    // Calcula a velocidade horizontal final
    velh = lerp(velh, _velh, .1);
	
	
}  

//Tomando dano 

// Se eu estou tomando dano, eu diminuo o timer do dano
sprite_index = spr_astronauta_Hit_;

// Tomando dano
var _inimigo = instance_place(x, y, obj_Inimigo_pai);

if (_inimigo) {
    // Dando o valor do timer dano
    timer_dano = tempo_dano;
    if (_inimigo.levou_dano == false && _inimigo.dano == false)
    {
        dano = true;
    }
}// CÓDIGO DE ANDAR E PULAR (Versão Consolidada)

// 1. INPUTS E DIREÇÃO (JÁ EXISTENTE NO SEU CÓDIGO)
var _left, _right, _jump, _xDirection;
_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
_left  = keyboard_check(vk_left)  or keyboard_check(ord("A"));
_jump = keyboard_check_pressed(vk_space);
_xDirection = _right - _left;

var _velh_target = _xDirection * velocidade; // Velocidade horizontal alvo

// 2. VERIFICAÇÃO DE AMBIENTE (JÁ EXISTENTE NO SEU CÓDIGO)
var _no_chao = place_meeting(x, y + 1, Obj_Bloco);
var _na_parede = place_meeting(x + _xDirection, y, Obj_Bloco);

// 3. MOVIMENTO HORIZONTAL E FLIP DO SPRITE
if (_xDirection != 0) {
    // Inverte o sprite para a direção do movimento
    image_xscale = _xDirection;
}

// O cálculo suave (lerp) da velocidade horizontal será feito no final.

// 4. LÓGICA DE CHÃO E PULOS
if (_no_chao) {
    // ESTÁ NO CHÃO: Reseta pulos e faz o Pulo Inicial

    qtd_pulos = max_pulos; // Reseta a contagem de pulos
    
    // Zera velocidade horizontal se estiver parado (Corrige Deslizamento!)
    if (_xDirection == 0) {
        velh = 0;
    }

    if (_jump) {
        velv = forca_pulo; // Impulso vertical para cima
        qtd_pulos--; // Gasta o primeiro pulo
        audio_play_sound(snd_cartoon_jump, 2, false);
    }
} else {
    // ESTÁ NO AR: Aplica Pulo Duplo e Wall Jump

    // Pulo Duplo: Se sobrou um pulo e o jogador apertou pular
    if (_jump && qtd_pulos > 0) {
        velv = forca_pulo;
        qtd_pulos--; // Gasta o segundo pulo
        audio_play_sound(snd_cartoon_jump, 2, false);
    }

    // Lógica Wall Jump (Se estiver na parede e pular)
    if (_na_parede && _jump) {
        velv = forca_pulo;
        velh = (10 * _xDirection) * -1; // Impulso horizontal oposto à parede
        audio_play_sound(snd_cartoon_jump, 2, false);
    }
    
    // GRAVIDADE é aplicada no final da função (para garantir que sempre caia).
}

// 5. APLICAÇÃO FINAL DE VELOCIDADE (Movimento Suave e Gravidade)

// Aplica a gravidade: A menos que esteja no chão, aplica a queda.
// Esta linha deve ser executada a cada step se não estiver no chão.
if (!_no_chao) {
    velv += gravidade;
}

// Suaviza a velocidade horizontal (Andar) para o alvo (velh -> _velh_target)
velh = lerp(velh, _velh_target, .1);

// A posição final (x += velh; y += velv;) deve ser executada no evento Step principal,
// após a resolução da colisão (que você já implementou).
                            
							
//pegando os controles 



	// Adiciona botão para mover para a direita
virtual_key_add(180, 600, 64, 64, vk_right);

	// Adiciona botão para mover para a esquerda
virtual_key_add(20, 600, 64, 64, vk_left);

	// Adiciona botão para pular (tecla Espaço)
virtual_key_add(1200, 600, 100, 100, vk_space);