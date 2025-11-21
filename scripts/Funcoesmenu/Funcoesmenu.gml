//Define ALign 
///@function define_align(vertical, horizontal)
function define_align(_ver, _hor)
{
	draw_set_halign(_hor);
	draw_set_valign(_ver);

}

function valor_ac(_anim, _animar = false, _chan = 0 )
{

	static _pos = 0, _val = 0;
	
	_pos += delta_time / 1000000;
	
	if (_animar) _pos = 0;
	
	
	var _canal = animcurve_get_channel(_anim, _chan);
	_val = animcurve_channel_evaluate(_canal, _pos);
	
	
	return _val;

}
global.volume = 0;
global.dificuldade = 1;

enum menu_acoes
{
	roda_metodo,
	carrega_menu,
	ajustes_menu
}

enum menus_lista
{
	principal,
	opcoes,
	tela,
	dificuldade,
	volume
}