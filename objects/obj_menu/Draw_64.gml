// Desenhar o botão "Iniciar Jogo"
if (mouse_x >= botao_inicio.x && mouse_x <= botao_inicio.x + botao_inicio.largura && 
    mouse_y >= botao_inicio.y && mouse_y <= botao_inicio.y + botao_inicio.altura)
{
    draw_set_color(c_gray);  // Cor quando o mouse passa por cima
}
else
{
    draw_set_color(c_white);  // Cor normal
}
draw_rectangle(botao_inicio.x, botao_inicio.y, botao_inicio.x + botao_inicio.largura, botao_inicio.y + botao_inicio.altura, false);
draw_set_color(c_black); // Texto preto para contraste
draw_text(botao_inicio.x + 50, botao_inicio.y + 15, "Iniciar Jogo");

// Desenhar o botão "Opções"
if (mouse_x >= botao_opcoes.x && mouse_x <= botao_opcoes.x + botao_opcoes.largura && 
    mouse_y >= botao_opcoes.y && mouse_y <= botao_opcoes.y + botao_opcoes.altura)
{
    draw_set_color(c_gray);
}
else
{
    draw_set_color(c_white);
}
draw_rectangle(botao_opcoes.x, botao_opcoes.y, botao_opcoes.x + botao_opcoes.largura, botao_opcoes.y + botao_opcoes.altura, false);
draw_set_color(c_black);
draw_text(botao_opcoes.x + 50, botao_opcoes.y + 15, "Opções");

// Desenhar o botão "Créditos"
if (mouse_x >= botao_creditos.x && mouse_x <= botao_creditos.x + botao_creditos.largura && 
    mouse_y >= botao_creditos.y && mouse_y <= botao_creditos.y + botao_creditos.altura)
{
    draw_set_color(c_gray);
}
else
{
    draw_set_color(c_white);
}
draw_rectangle(botao_creditos.x, botao_creditos.y, botao_creditos.x + botao_creditos.largura, botao_creditos.y + botao_creditos.altura, false);
draw_set_color(c_black);
draw_text(botao_creditos.x + 50, botao_creditos.y + 15, "Créditos");

// Desenhar o botão "Sair"
if (mouse_x >= botao_sair.x && mouse_x <= botao_sair.x + botao_sair.largura && 
    mouse_y >= botao_sair.y && mouse_y <= botao_sair.y + botao_sair.altura)
{
    draw_set_color(c_gray);
}
else
{
    draw_set_color(c_white);
}
draw_rectangle(botao_sair.x, botao_sair.y, botao_sair.x + botao_sair.largura, botao_sair.y + botao_sair.altura, false);
draw_set_color(c_black);
draw_text(botao_sair.x + 50, botao_sair.y + 15, "Sair");
