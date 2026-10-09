Table "Linhas de Produção" [headercolor: #175e7a] {
	id_linha integer [ pk, increment, not null ]
	nome_linha varchar(255) [ not null ]
	setor varchar(255) [ not null ]
	capacidade_diaria varchar(150) [ not null ]
}

Table "Peças e Insumos" [headercolor: #175e7a] {
	id_peca integer [ pk, increment, not null ]
	id_linha integer [ not null ]
	nome_peca varchar(255) [ not null ]
	quantidade_estoque numeric [ not null ]
}

Table "Produtos Finais" [headercolor: #175e7a] {
	id_produto integer [ pk, increment, not null ]
	id_peca integer [ not null ]
	nome_produto varchar(255) [ not null ]
	numero_serie varchar(35) [ not null ]
}

Table "Entregas Logística" [headercolor: #175e7a] {
	id_entrega integer [ pk, increment, not null ]
	id_produto integer [ not null ]
	destino varchar(255) [ not null ]
	status_envio varchar(255) [ not null ]
}

Ref "fk_Produtos Finais_id_produto_Entregas Logística" {
	"Produtos Finais".id_produto < "Entregas Logística".id_produto [ delete: no action, update: no action ]
}

Ref "fk_Produtos Finais_id_peca_Peças e Insumos" {
	"Produtos Finais".id_peca > "Peças e Insumos".id_peca [ delete: no action, update: no action ]
}

Ref "fk_Peças e Insumos_id_linha_Linhas de Produção" {
	"Peças e Insumos".id_linha > "Linhas de Produção".id_linha [ delete: no action, update: no action ]
}