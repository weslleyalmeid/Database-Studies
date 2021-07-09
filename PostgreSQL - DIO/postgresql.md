## ROLES

CREATE ROLE professores NOCREATEDB NOCREATEROLE INHERIT NOLOGIN NOBYPASSRLS CONNECTION LIMIT 10;

ALTER ROLE professores PASSWORD '123456';

-- CREATE ROLE weslley LOGIN PASSWORD '123456';

DROP ROLE weslley;
--  CREATE ROLE daniel LOGIN PASSWORD '123456' IN ROLE professores;

-- CREATE ROLE weslley LOGIN PASSWORD '123456' ROLE professores;

CREATE TABLE test(
	nome varchar
);

-- Dando privilégio na tabela teste para todos os professores
GRANT ALL ON TABLE test TO professores;

-- proibido weslley acessar tabela test
-- CREATE ROLE weslley LOGIN PASSWORD '123456'

-- permitindo weslley acessar a tabela test
CREATE ROLE weslley INHERIT LOGIN PASSWORD '123456' IN ROLE professores;

-- tirar todas as permissoes do weslley
REVOKE professores FROM weslley;





