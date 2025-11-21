// Evento de Game Over

// Zerar vidas e morangos
global.life = 3; // Defina o número de vidas iniciais
global.morangos = 0; // Zera o contador de morangos

// Desenha a tela de Game Over
draw_set_color(c_black);
draw_rectangle(0, 0, 860, 450, false); // Fundo preto

// Desenha o texto centralizado
draw_set_color(c_white);
draw_set_font(fnt_game_over); // Fonte de Game Over
var text = "GAME OVER";

// Calculando a posição central da tela
var x_center = 860 / 2;
var y_center = 450 / 2;

// Desenhando o texto "GAME OVER" centralizado
draw_text(x_center - string_width(text) / 2, y_center - 50, text); 

// Mensagens de instrução
draw_set_font(Fnt_arial);
var restart_text = "Pressione [R] para Reiniciar";
var quit_text = "Pressione [Q] para Sair";

// Ajustando a posição central das mensagens abaixo do "GAME OVER"
draw_text(x_center - string_width(restart_text) / 2, y_center + 10, restart_text);
draw_text(x_center - string_width(quit_text) / 2, y_center + 50, quit_text);
