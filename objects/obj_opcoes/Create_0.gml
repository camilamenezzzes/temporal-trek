// Variáveis para controlar as opções de volume
volume_music = 1;  // Volume da música (de 0 a 1)
volume_sfx = 1;    // Volume dos efeitos sonoros (de 0 a 1)

// Inicializando a opção selecionada (0 = Música, 1 = Efeitos sonoros, 2 = Tela Cheia)
opcao_selecionada = 0; 

// Definindo as opções do menu
opcoes = ["Música", "Efeitos", "Tela Cheia"];  // Exemplo de opções

// Calculando o número total de opções
op_max = array_length_1d(opcoes);  // Conta o número de itens no array 'opcoes'
