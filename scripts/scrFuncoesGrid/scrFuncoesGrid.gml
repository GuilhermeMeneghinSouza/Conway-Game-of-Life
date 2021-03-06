// @grid_funcoes Funcoes de controle da grid
function criar_grid () {
	numero_colunas = room_width div tamanho_celula;
	numero_linhas = room_height div tamanho_celula;
	
	grid = ds_grid_create(numero_colunas, numero_linhas);
	ds_grid_clear(grid, MORTO);
}

function mudar_tamanho () {
	// O numero de colunas e o numero de linhas e inversamente proporcional ao tamanhho da celula
	
	if keyboard_check_pressed(vk_up) {
		if tamanho_celula > TAMANHO_MIN tamanho_celula /= 2;	// Aumenta o numero de celulas
		criar_grid();
	}
	
	else if keyboard_check_pressed(vk_down) {
		if tamanho_celula < TAMANHO_MAX tamanho_celula *= 2;	// Diminui o numero de cellas
		criar_grid();
	}
}

function montar_celulas () {
	// Checa os botoes do mouse
	if mouse_check_button(mb_left) {
		var xx_grid = mouse_x div tamanho_celula;
		var yy_grid = mouse_y div tamanho_celula;
		
		grid[# xx_grid, yy_grid] = VIVO;						// Cria uma celula viva
	}
	else if mouse_check_button(mb_right) {
		var xx_grid = mouse_x div tamanho_celula;
		var yy_grid = mouse_y div tamanho_celula;
		
		grid[# xx_grid, yy_grid] = MORTO;						// Mata uma celula
	}
}

