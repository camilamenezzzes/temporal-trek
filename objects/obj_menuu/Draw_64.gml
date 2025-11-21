// Defina as variáveis de largura e altura da tela
var _larg = display_get_gui_width();  // Largura da tela
var _alt = display_get_gui_height();  // Altura da tela

// Define a velocidade de mudança dos frames
image_speed = 0.1; // Velocidade mais lenta de troca de frames, ajuste conforme necessário

// Desenha o fundo com o frame atual do sprite
draw_sprite_ext(spr_fundomenu, image_index, 0, 0, _larg / sprite_get_width(spr_fundo_menu), _alt / sprite_get_height(spr_fundo_menu), 0, c_white, 1);

// Agora desenhe o menu
desenha_menu(menus[pag]);


