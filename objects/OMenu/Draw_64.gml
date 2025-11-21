draw_set_font(Fmenu);
draw_set_color(c_white);

var dist = 55;
var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height();
var x1 = gui_largura / 2;
var y1 = gui_altura / 2;

// Largura e altura da imagem de fundo
var largura_sprite = sprite_get_width(spr_fundo_menu); 
var altura_sprite = sprite_get_height(spr_fundo_menu);

// Desenhar a imagem de fundo
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

// Desenha a imagem de fundo uma vez (não precisa ser repetida por opção)
draw_sprite(spr_fundo_menu, 0, _cam_x, _cam_y);

// Agora, desenhar as opções
for (var i = 0; i < op_max; i++) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);

    // Calcula a posição vertical das opções
    var y_offset = y1 + (dist * i);

    // Altera a cor dependendo da opção selecionada
    if (index == i) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }

    // Desenha o texto da opção
    draw_text(x1, y_offset, opcoes[i]);
}

draw_set_font(-1);
