/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Desenhar sprite do morango com animação
draw_sprite_ext(spr_morango, (get_timer()/1000000)*10, 20, 30, 2, 2, 0, c_yellow, 1);

// Configuração do texto
draw_set_font(Fnt_arial);
draw_set_color(c_black);
draw_text(40, 20, "x" + string(global.morangos));
draw_set_color(c_white);
draw_set_font(-1);

// Desenhar as vidas de acordo com o número de vidas restantes
if (global.life == 3) {
    draw_sprite(spr_life3, 0, 5, 50);
}
else if (global.life == 2) {
    draw_sprite(spr_life2, 0, 5, 50);
}
else if (global.life == 1) {
    draw_sprite(spr_life1, 0, 5, 50);
}

// Verificar se o player morreu
if (global.life <= 0) {
    // Zerar os morangos
    global.morangos = 0;
}
