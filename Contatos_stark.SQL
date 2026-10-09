Table "Meios Comunicacao" [headercolor: #08bd11] {
	id_meio integer [ pk, increment, not null ]
	contato_id integer [ not null ]
	tipo_comunicacao varchar(60) [ not null ]
	detalhe_contato varchar(50) [ not null ]
	nivel_prioridade varchar(40) [ not null ]
}

Table "Registros Interacoes" [headercolor: #175e7a] {
	id_interacao integer [ pk, increment, not null ]
	contato_id integer [ not null ]
	data_contato date [ not null ]
	assunto_principal varchar(100) [ not null ]
	local_encontro varchar(90) [ not null ]
}

Table Contatos [headercolor: #7a1717] {
	id_contato integer [ pk, increment, not null ]
	categoria_id integer [ not null ]
	nome_completo varchar(60) [ not null ]
	cargo_funcao varchar(70) [ not null ]
	empresa_afiliada varchar(40) [ not null ]
	status_relacao varchar(80) [ not null ]
}

Table "Categoria Contato" [headercolor: #191d1f] {
	id_categoria integer [ pk, increment, not null ]
	nome_categoria varchar(100) [ not null ] aqui fiz a modificaçãO do "varchar" 255 para 100
	descricao_nivel varchar(50) [ not null ]
}

Ref "fk_Categoria Contato_id_categoria_Contatos" {
	"Categoria Contato".id_categoria < Contatos.categoria_id [ delete: no action, update: no action ]
}

Ref "fk_Contatos_id_contato_Meios Comunicacao" {
	Contatos.id_contato < "Meios Comunicacao".contato_id [ delete: no action, update: no action ]
}

Ref "fk_Registros Interacoes_contato_id_Contatos" {
	"Registros Interacoes".contato_id > Contatos.id_contato [ delete: no action, update: no action ]
}