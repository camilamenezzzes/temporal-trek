/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


sel = 0;
marg_val = 0;
marg_total = 32;
pag = 0;


#region MÉTODOS

desenha_menu = function(_menu)
{
    draw_set_font(Fmenu);
    define_align(0, 0);

    var _qtd = array_length(_menu);
    var _alt = display_get_gui_height();
    var _larg = display_get_gui_width();
    var _espaco_y = string_height("I") + 16;
    var _alt_menu = _espaco_y * _qtd;

    for (var i = 0; i < _qtd; i++)
    {
        var _cor = c_white, _marg_x = 0;
        var _texto = _menu[i][0];

        if (menus_sel[pag] == i)
        {
            _cor = c_fuchsia;
            _marg_x = marg_val;
        }

        draw_text_color(20 + _marg_x, (_alt / 2) - _alt_menu / 2 + (i * _espaco_y), _texto, _cor, _cor, _cor, _cor, 1);
    }

    for (var i = 0; i < _qtd; i++)
    {
        switch (_menu[i][1])
        {
            case menu_acoes.ajustes_menu:
            {
                var _indice = _menu[i][3];
                var _txt = _menu[i][4][_indice];

                // Eu só posso ir para a esquerda SE somente SE eu não estou no índice 0
                var _esq = _indice > 0 ? "<<" : "";

                // Eu só posso ir para a direita SE somente SE eu ainda não estou no final
                var _dir = _indice < array_length(_menu[i][4]) - 1 ? " >> " : "";

                var _cor = c_white;

                if (alterando && menus_sel[pag] == i) _cor = c_red;

                draw_text_color(_larg / 2, (_alt / 2) - _alt_menu / 2 + (i * _espaco_y), _esq + _txt + _dir, _cor, _cor, _cor, _cor, 1);
                break;
            }
        }
    }

    draw_set_font(-1);
    define_align(-1, -1);
}

	
controla_menu = function(_menu)
{
    var _up, _down, _avanca, _recua;
    var _sel = menus_sel[pag];
    static _animar = false;

    _up = keyboard_check_pressed(vk_up);
    _down = keyboard_check_pressed(vk_down);
    _avanca = keyboard_check_pressed(vk_enter);
    _recua = keyboard_check_pressed(vk_escape);
    _left = keyboard_check_pressed(vk_left);
    _right = keyboard_check_pressed(vk_right);

    if (!alterando)
    {
        if (_up or _down)
        {
            menus_sel[pag] += _down - _up;
            var _tam = array_length(_menu) - 1;
            menus_sel[pag] = clamp(menus_sel[pag], 0, _tam);
            _animar = true;
        }
    }
    else
    {
        _animar = false;

        if (_right or _left)
        {
            var _limite = array_length(_menu[_sel][4]) - 1;
            menus[pag][_sel][3] += _right - _left;
            menus[pag][_sel][3] = clamp(menus[pag][_sel][3], 0, _limite);
        }
    }

    if (_avanca)
    {
        switch (_menu[_sel][1])
        {
            case menu_acoes.roda_metodo: _menu[_sel][2](); break;
            case menu_acoes.carrega_menu: pag = _menu[_sel][2]; break;
            case menu_acoes.ajustes_menu:
                alterando = !alterando;
                if (!alterando)
                {
                    var _arg = _menu[_sel][3];
                    _menu[_sel][2](_arg);
                }
                break;
        }
    }

    if (_animar)
    {
        marg_val = marg_total * valor_ac(ac_margem, _up ^^ _down);
    }
}


iniciar_jogo = function()
{
	room_goto(FaseEmPlataforma);
}

fecha_jogo = function()
{
	game_end();
}

teste = function()
{
	show_message("teste")
}

ajusta_tela = function(_valor)
{
	switch(_valor)
	{
		case 0: window_set_fullscreen(true); break;
			
		case 1: window_set_fullscreen(false); break;
	}
}

ajusta_volume = function(_valor)
{
    switch(_valor)
    {
        case 0: global.volume = 0; break;     // Volume 0 (mudo)
        case 1: global.volume = 0.5; break;   // Volume 50%
        case 2: global.volume = 1; break;     // Volume 100%
    }
    // Alterar o volume do som global no jogo (música, efeitos sonoros, etc.)
    audio_sound_gain(snd_music_fase, global.volume, 0);
    audio_sound_gain(snd_cartoon_jump, global.volume, 0);
}


ajusta_dificuldade = function(_valor)
{
	switch(_valor)
	{
		case 0: global.dificuldade = .5; break; 
		case 1: global.dificuldade = 1; break; 
		case 2: global.dificuldade = 1.5; break; 
		case 3: global.dificuldade = 3; break; 
	}
}
#endregion



menu_principal =	[
						["Iniciar",menu_acoes.roda_metodo, iniciar_jogo],
						["Opções",menu_acoes.carrega_menu, menus_lista.opcoes],
						["Sair", menu_acoes.roda_metodo, fecha_jogo]
					];

menu_opcoes =	[
					["Tipo de janela",menu_acoes.carrega_menu, menus_lista.tela],
					["Dificuldade",menu_acoes.carrega_menu, menus_lista.dificuldade],
					["Volume",menu_acoes.roda_metodo, menus_lista.volume],
					["Voltar",menu_acoes.carrega_menu, menus_lista.principal]
				
				];
				
menu_dificuldade =	[
						["Dificuldade", menu_acoes.ajustes_menu,menus_lista.dificuldade,1,["Facil","Normal","Dificil","Impossivel"]],
						["Voltar",menu_acoes.carrega_menu, menus_lista.opcoes]
					];
					
menu_tela =	[
				["Tipo de tela", menu_acoes.ajustes_menu, ajusta_tela, 1,["Tela cheia","Janela"]],
				["Voltar",menu_acoes.carrega_menu, menus_lista.opcoes] 
			];
			
menu_volume =	[
					 ["Volume", menu_acoes.ajustes_menu, ajusta_volume, 1, ["Mudo", "50%", "100%"]],
					 ["Voltar",menu_acoes.carrega_menu, menus_lista.opcoes]

				];

menus = [menu_principal,menu_opcoes,menu_tela,menu_dificuldade];

//Salvar seleção 
menus_sel = array_create(array_length(menus),0);

alterando = false;

// Evento: Criar (Create Event) do obj_menu

// 1. Parar qualquer música anterior (para garantir que a música do menu não se sobreponha a outras)
audio_stop_all(); 

// 2. Toca a música "snd_menu" em loop.
// Parâmetros: (som, prioridade, loop)
audio_play_sound(snd_menu, 1, true);


