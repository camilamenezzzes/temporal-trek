/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(move_checkpoint){

	velh = 0;
	velv = 0;
	
	
	if(image_index >= image_number-1)
	{
		var _to_start = true;
		
		if(instance_exists(obj_chekpoint)){
			if(obj_chekpoint.flag_ativa){
				x=obj_chekpoint.x;
				y=obj_chekpoint.y-5;
				_to_start = false;
			}
		}
		
		if(_to_start){
			x = obj_start.x;
			y = obj_start.y;
		}
		
		muda_sprite(spr_player_entrando);
	}

	if(sprite_index == spr_player_entrando){
		if(image_index >= image_number-1){
			move_checkpoint = false;	
		}
	}
	
}	

// ----------------------------------------------------------------------
// 1. LÓGICA DE DANO: DETECÇÃO DE COLISÃO COM INIMIGO/PERIGO
// ----------------------------------------------------------------------

// Verifica se Alexia colidiu com qualquer inimigo pai (Obj_Inimigo_pai)
var _inimigo_colidido = instance_place(x, y, obj_Inimigo_pai);

// Se houver colisão E se o timer de dano (invencibilidade) NÃO estiver ativo
if (_inimigo_colidido && timer_dano == 0) 
{
    // Ação 1: Causa Dano (Diminui a vida)
    global.life -= 1; 

    // Ação 2: Ativa o Timer de Invencibilidade
    timer_dano = tempo_dano; 
    
    // Ação 3: Feedback Visual/Sonoro
    // Mudar para o sprite de hit (Se tiver um)
    sprite_index = spr_astronauta_Hit_; 
    
    // Opcional: Adicionar um impulso para o lado oposto ao inimigo (Knockback)
    // var _dir_knockback = sign(x - _inimigo_colidido.x); 
    // velh = _dir_knockback * 4; // Ex: 4 pixels de impulso
    // velv = forca_pulo / 2;     // Ex: Um pequeno pulo
    
    // Opcional: Tocar som de dano
    // audio_play_sound(snd_dano, 5, false);

    // Verifica se Alexia Morreu
    if (global.life <= 0) {
        // Ativa o sistema de respawn/checkpoint (Seu código anterior)
        move_checkpoint = true; 
    }
}

// ----------------------------------------------------------------------
// 2. LÓGICA DE INVENCIBILIDADE (TIMER)
// ----------------------------------------------------------------------

if (timer_dano > 0) 
{
    // Ação 1: Diminui o timer a cada frame
    timer_dano--; 
    
    // Ação 2: Aplica o efeito de piscar (Feedback Visual)
    // O 'image_alpha' controla a transparência do sprite.
    // Usamos o módulo (%) para fazer o sprite piscar em intervalos rápidos.
    if (timer_dano % 4 == 0) {
        // Se o alpha está em 1 (visível), muda para 0.4 (transparente)
        image_alpha = (image_alpha == 1) ? 0.4 : 1; 
    }
} 
else 
{
    // Se o timer terminou, garante que o sprite esteja totalmente visível
    image_alpha = 1; 
}