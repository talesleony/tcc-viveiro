use viveirinho;
create database viveirinho;

//Registro das Mudas e Substratos
create table ingredientes(
    idingred int not null ,
    constraint id_ingred_pk primary key(idingred),
    NomeIngred varchar(100) not null
);

create table compor(
    idingred int not null ,
    idsubs int not null ,
    Unidade varchar(100) not null,
    CONSTRAINT fk_ingredientes_substrato
        FOREIGN KEY (idingred)
            REFERENCES ingredientes (idingred),
	CONSTRAINT fk_substrato_ingredientes
        FOREIGN KEY (idsubs)
            REFERENCES substrato (idsubs)
);

create table substrato(
    idsubs int not null ,
    constraint id_subs_pk primary key(idsubs),
    Descricao varchar(150) not null
);

create table muda(
    idmuda int not null ,
    constraint id_muda_pk primary key(idmuda),
    nomeMuda varchar(150) not null,
    classe int not null,
     CONSTRAINT fk_classe_muda
        FOREIGN KEY (classe)
            REFERENCES classe (idclasse),
    tempoProducao_dias int 
);

create table classe(
    idclasse int not null ,
    constraint id_classe_pk primary key(idclasse),
    nomeClasse varchar(150) not null
);

create table usar(
    idmuda int not null ,
    idsubs int not null ,
    CONSTRAINT fk_muda_usar
        FOREIGN KEY (idmuda)
            REFERENCES muda (idmuda),
	CONSTRAINT fk_substrato_usar
        FOREIGN KEY (idsubs)
            REFERENCES substrato (idsubs)
);

//Produção e registro do Lote

create table lote(
    idlote int not null ,
    constraint id_lote_pk primary key(idlote),
    
	idmuda int not null ,
    idsubs int not null ,
    CONSTRAINT fk_muda_lote
        FOREIGN KEY (idmuda)
            REFERENCES muda (idmuda),
	CONSTRAINT fk_substrato_lote
        FOREIGN KEY (idsubs)
            REFERENCES substrato (idsubs),
    
	DataPlantio varchar(100) not null,
    DataFinaliza varchar(100),
    QuantidadeUni int
);

create table recipiente(
    idreci int not null ,
    constraint id_reci_pk primary key(idreci),
    tipo varchar(150) not null,
    capacidade varchar(150) not null
);

create table localizado(
    idreci int not null ,
    idlote int not null ,
    CONSTRAINT fk_recipiente_localizado
        FOREIGN KEY (idreci)
            REFERENCES recipiente (idreci),
	CONSTRAINT fk_lote_localizado
        FOREIGN KEY (idlote)
            REFERENCES lote (idlote)
);
RENAME TABLE localizado TO utilizar;


//Saida das mudas

create table destinatario(
    iddesti int not null ,
    constraint id_desti_pk primary key(iddesti),
    nomeDesti varchar(30) not null,
    Tipo varchar(1) not null
);

create table rezerva(
    idRezerva int not null ,
    constraint id_rezerva_pk primary key(idRezerva),
    DataSaida varchar(30) not null,
    Qtd varchar(1) not null,
    iddesti int not null ,
    idlote int not null ,
    
        CONSTRAINT fk_lote_rezerva
        FOREIGN KEY (idlote)
            REFERENCES lote (idlote),
	CONSTRAINT fk_destinatario_rezerva
        FOREIGN KEY (iddesti)
            REFERENCES destinatario (iddesti)
);
RENAME TABLE rezerva TO reserva;

create table saiu(
    idSaida int not null ,
    constraint id_saiu_pk primary key(idSaida),
    DataSaida varchar(30) not null,
    Qtd varchar(1) not null,
    iddesti int not null ,
    idlote int not null ,
    
        CONSTRAINT fk_lote_saiu
        FOREIGN KEY (idlote)
            REFERENCES lote (idlote),
	CONSTRAINT fk_destinatario_saiu
        FOREIGN KEY (iddesti)
            REFERENCES destinatario (iddesti)
);
RENAME TABLE saiu TO Fornecer;







