-- Criação das Tabelas
CREATE TABLE CLIENTE (
    id_cliente          NUMBER(10)      PRIMARY KEY,
    nome                VARCHAR2(100)   NOT NULL,
    genero              VARCHAR2(20)    NOT NULL,
    data_nascimento     DATE            NOT NULL,
    cpf                 VARCHAR2(14)    NOT NULL UNIQUE,
    rg                  VARCHAR2(20),
    filiacao_pai        VARCHAR2(100),
    filiacao_mae        VARCHAR2(100),
    nacionalidade       VARCHAR2(50),
    naturalidade        VARCHAR2(50),
    endereco_completo   VARCHAR2(200),
    telefone            VARCHAR2(20),
    email               VARCHAR2(100),
    observacoes         VARCHAR2(200)
);


CREATE TABLE DADOS_SAUDE (
    id_dado_saude   NUMBER(10)     PRIMARY KEY,
    id_cliente      NUMBER(10)     NOT NULL,
    tipo            VARCHAR2(20)   NOT NULL,
    descricao       VARCHAR2(200)  NOT NULL,

    CONSTRAINT fk_dados_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES CLIENTE(id_cliente)
);


CREATE TABLE CONVENIO (
    id_convenio   NUMBER(10)     PRIMARY KEY,
    nome          VARCHAR2(100)  NOT NULL,
    codigo        VARCHAR2(20)
);


CREATE TABLE MEDICO (
    id_medico       NUMBER(10)     PRIMARY KEY,
    nome            VARCHAR2(100)  NOT NULL,
    crm             VARCHAR2(20)   NOT NULL UNIQUE,
    especialidade   VARCHAR2(50)
);


CREATE TABLE TECNICO (
    id_tecnico   NUMBER(10)     PRIMARY KEY,
    nome         VARCHAR2(100)  NOT NULL
);


CREATE TABLE TIPO_EXAME (
    id_tipo_exame  NUMBER(10)      PRIMARY KEY,
    nome           VARCHAR2(100)   NOT NULL,
    categoria      VARCHAR2(20)    NOT NULL,
    codigo_tuss    VARCHAR2(20)    NOT NULL UNIQUE,
    preparo        VARCHAR2(300),
    descricao      VARCHAR2(300),

    CONSTRAINT chk_tipo_exame_categoria CHECK (categoria IN ('LAB', 'IMAGEM'))
);


CREATE TABLE VALORES_REFERENCIA (
    id_valor_ref   NUMBER(10)     PRIMARY KEY,
    id_tipo_exame  NUMBER(10)     NOT NULL,
    genero         VARCHAR2(10)   NOT NULL,
    idade_minima   NUMBER(3)      NOT NULL,
    idade_maxima   NUMBER(3)      NOT NULL,
    valor_min      NUMBER(7,2)    NOT NULL,
    valor_max      NUMBER(7,2)    NOT NULL,

    CONSTRAINT fk_valref_tipoexame
        FOREIGN KEY (id_tipo_exame)
        REFERENCES TIPO_EXAME(id_tipo_exame),

    CONSTRAINT chk_faixa_etaria CHECK (idade_minima <= idade_maxima)
);


CREATE TABLE ATENDIMENTO (
    id_atendimento        NUMBER(10)     PRIMARY KEY,
    id_cliente            NUMBER(10)     NOT NULL,
    data_hora             DATE           NOT NULL,
    tipo_atendimento      VARCHAR2(20)   NOT NULL,
    id_convenio           NUMBER(10),
    autorizacao_convenio  VARCHAR2(30),
    senha_atendimento     VARCHAR2(10)   NOT NULL,

    CONSTRAINT fk_atend_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES CLIENTE(id_cliente),

    CONSTRAINT fk_atend_convenio
        FOREIGN KEY (id_convenio)
        REFERENCES CONVENIO(id_convenio)
);


CREATE TABLE PEDIDO_EXAME (
    id_pedido             NUMBER(10)     PRIMARY KEY,
    id_atendimento        NUMBER(10)     NOT NULL,
    id_medico_solicitante NUMBER(10),
    cid                   VARCHAR2(20),
    observacao_medico     VARCHAR2(300),
    data_solicitacao      DATE           NOT NULL,

    CONSTRAINT fk_pedido_atendimento
        FOREIGN KEY (id_atendimento)
        REFERENCES ATENDIMENTO(id_atendimento),

    CONSTRAINT fk_pedido_medico
        FOREIGN KEY (id_medico_solicitante)
        REFERENCES MEDICO(id_medico)
);


CREATE TABLE ITEM_PEDIDO (
    id_item_pedido   NUMBER(10)     PRIMARY KEY,
    id_pedido        NUMBER(10)     NOT NULL,
    id_tipo_exame    NUMBER(10)     NOT NULL,
    observacao_preparo VARCHAR2(200),
    status           VARCHAR2(20)   NOT NULL,

    CONSTRAINT fk_item_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES PEDIDO_EXAME(id_pedido),

    CONSTRAINT fk_item_tipo_exame
        FOREIGN KEY (id_tipo_exame)
        REFERENCES TIPO_EXAME(id_tipo_exame)
);


CREATE TABLE AGENDAMENTO (
    id_agendamento  NUMBER(10)   PRIMARY KEY,
    id_item_pedido  NUMBER(10),
    data_hora       DATE         NOT NULL,
    id_tecnico      NUMBER(10),
    sala_ou_box     VARCHAR2(50),

    CONSTRAINT fk_agendamento_item
        FOREIGN KEY (id_item_pedido)
        REFERENCES ITEM_PEDIDO(id_item_pedido),

    CONSTRAINT fk_agendamento_tecnico
        FOREIGN KEY (id_tecnico)
        REFERENCES TECNICO(id_tecnico)
);


CREATE TABLE PROCEDIMENTO (
    id_procedimento  NUMBER(10)    PRIMARY KEY,
    id_item_pedido   NUMBER(10)    NOT NULL,
    id_tecnico       NUMBER(10)    NOT NULL,
    data_hora        DATE          NOT NULL,
    observacao       VARCHAR2(200),

    CONSTRAINT fk_proc_item
        FOREIGN KEY (id_item_pedido)
        REFERENCES ITEM_PEDIDO(id_item_pedido),

    CONSTRAINT fk_proc_tecnico
        FOREIGN KEY (id_tecnico)
        REFERENCES TECNICO(id_tecnico)
);


CREATE TABLE RESULTADO_EXAME (
    id_resultado     NUMBER(10)     PRIMARY KEY,
    id_item_pedido   NUMBER(10)     NOT NULL,
    valor_numerico   NUMBER(10,2),
    unidade          VARCHAR2(20),
    texto_resultado  VARCHAR2(300),
    data_hora        DATE           NOT NULL,

    CONSTRAINT fk_res_item
        FOREIGN KEY (id_item_pedido)
        REFERENCES ITEM_PEDIDO(id_item_pedido)
);


CREATE TABLE LAUDO (
    id_laudo       NUMBER(10)     PRIMARY KEY,
    id_resultado   NUMBER(10)     NOT NULL,
    id_medico      NUMBER(10)     NOT NULL,
    texto_laudo    VARCHAR2(1000) NOT NULL,
    data_emissao   DATE           NOT NULL,

    CONSTRAINT fk_laudo_resultado
        FOREIGN KEY (id_resultado)
        REFERENCES RESULTADO_EXAME(id_resultado),

    CONSTRAINT fk_laudo_medico
        FOREIGN KEY (id_medico)
        REFERENCES MEDICO(id_medico)
);


CREATE TABLE ACESSO_EXAME (
    id_acesso        NUMBER(10)      PRIMARY KEY,
    id_atendimento   NUMBER(10)      NOT NULL UNIQUE,
    codigo_acesso    VARCHAR2(50)    NOT NULL,
    senha_acesso     VARCHAR2(50)    NOT NULL,

    CONSTRAINT fk_acesso_atendimento
        FOREIGN KEY (id_atendimento)
        REFERENCES ATENDIMENTO(id_atendimento)
);
