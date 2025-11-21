// Exibe as opções no menu
draw_set_font(Fmenu);
draw_set_color(c_white);

var dist = 55;
var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height();
var x1 = gui_largura/2;
var y1 = gui_altura/2;

// Desenha as opções do menu
for (var i = 0; i < op_max; i++) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);

    // Desenha a imagem de fundo para a opção selecionada
    draw_sprite(spr_fundo_menu, 0, x1, y1 + (dist * i));

    // Define a cor da opção selecionada
    if (index == i) {
        draw_set_color(c_yellow);  // Cor para a opção selecionada
    } else {
        draw_set_color(c_white);   // Cor para as outras opções
    }

    // Desenha o texto da opção
    draw_text(x1, y1 + (dist * i), opcoes[i]);
}

draw_set_font(-1);
