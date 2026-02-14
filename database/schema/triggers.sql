CREATE OR REPLACE TRIGGER trg_gera_acesso_exame
AFTER INSERT ON ATENDIMENTO
FOR EACH ROW
BEGIN
    INSERT INTO ACESSO_EXAME (
        id_acesso,
        id_atendimento,
        codigo_acesso,
        senha_acesso
    )
    VALUES (
        seq_acesso.NEXTVAL,
        :NEW.id_atendimento,
        'ACESSO' || :NEW.id_atendimento,
        TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(100000,999999)))
    );
END;
/

ALTER TABLE RESULTADO_EXAME
ADD CONSTRAINT un_resultado_item UNIQUE (id_item_pedido);