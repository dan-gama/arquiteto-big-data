/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 06: Quantos registros possuem na base de dados do chess?
	Resp: Nenhuma das alternativas (1332).
/* ------------------------------------------------------------------------------------------------------------------ */
db = db.getSiblingDB("chessdb");
db.getCollection("info_jogadores").find({}).count();

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 07: Qual o total de jogadores que são dos Estados Unidos?
	Resp: 223.
/* ------------------------------------------------------------------------------------------------------------------ */
db = db.getSiblingDB("chessdb");
db.getCollection("info_jogadores").find({country:'https://api.chess.com/pub/country/US'}).count();

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 08: Quantos seguidores (número de pessoas) possui o jogador Rafael Leitao?
	Resp: 1707.
/* ------------------------------------------------------------------------------------------------------------------ */
db = db.getSiblingDB("chessdb");
db.getCollection("info_jogadores").find({name:'Rafael Leitao'}, {followers:1});

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 09: Quantas pessoas do dataset NÃO são streamer?
	Resp:1266.
/* ------------------------------------------------------------------------------------------------------------------ */
db = db.getSiblingDB("chessdb");
db.getCollection("info_jogadores").find({is_streamer:false}).count();

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 10: Quais são as classificações presentes no dataset jogadores_chess para a feature status?
	Resp: basic, premium, staff
/* ------------------------------------------------------------------------------------------------------------------ */
db = db.getSiblingDB("chessdb");
db.getCollection("info_jogadores").distinct('status')

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 12: Quais são os jogadores que possuem mais que 35.000 seguidores
	Resp: Simon Williams, Hikaru Nakamura, Magnus Carlsen
/* ------------------------------------------------------------------------------------------------------------------ */
db = db.getSiblingDB("chessdb");
db.getCollection("info_jogadores").find({followers: {$gt: 35000}}, {name:1})

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 13: Quais são os jogadores que possuem mais que 50.000 seguidores e sua localização
	Resp: Hikaru Nakamura - Sunrise, Florida
/* ------------------------------------------------------------------------------------------------------------------ */
db = db.getSiblingDB("chessdb");
db.getCollection("info_jogadores").find({followers: {$gt: 50000}}, {name:1, location:1})

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 14: Qual a sigla do país do jogador Magnus Carlsen
	Resp: Hikaru Nakamura - Sunrise, Florida
/* ------------------------------------------------------------------------------------------------------------------ */
db = db.getSiblingDB("chessdb");
db.getCollection("info_jogadores").find({name:'Magnus Carlsen'}, {country:1})

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 15: Qual a localização do jogador Jorge Ferreira
	Resp: Hikaru Nakamura - Sunrise, Florida
/* ------------------------------------------------------------------------------------------------------------------ */