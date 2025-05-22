INSERT INTO professor (cpf, nome, data_nasc, posicao, especialidade) VALUES
('11122233344', 'Dr. João Silva', '1975-03-15', 'Professor Titular', 'Inteligência Artificial'),
('55566677788', 'Dra. Maria Souza', '1980-07-20', 'Professor Adjunto', 'Banco de Dados'),
('99988877766', 'Dr. Pedro Santos', '1970-01-01', 'Professor Associado', 'Engenharia de Software'),
('12345678901', 'Dra. Ana Costa', '1985-11-25', 'Professor Substituto', 'Redes de Computadores'),
('09876543210', 'Dr. Carlos Oliveira', '1968-04-10', 'Professor Titular', 'Segurança da Informação');

INSERT INTO departamento (nome, escritorio, prof_chefe_dpto) VALUES
('Ciência da Computação', 'Sala A101', 1), -- Dr. João Silva como chefe
('Engenharia Elétrica', 'Sala B202', 2),  -- Dra. Maria Souza como chefe
('Matemática Aplicada', 'Sala C303', 3),  -- Dr. Pedro Santos como chefe
('Física', 'Sala D404', 4),             -- Dra. Ana Costa como chefe
('Química', 'Sala E505', 5);            -- Dr. Carlos Oliveira como chefe

INSERT INTO aluno (cpf, nome, data_nasc, programa, departamento_iddepartamento, conselheiro) VALUES
('11111111111', 'Ana Paula Lima', '1995-02-10', 'Mestrado em IA', 1, NULL), -- Aluno 1, sem conselheiro inicial
('22222222222', 'Bruno Guedes', '1996-05-22', 'Doutorado em BD', 2, 1),    -- Aluno 2, conselheiro é Aluno 1
('33333333333', 'Carla Mendes', '1997-08-01', 'Mestrado em ES', 3, 2),    -- Aluno 3, conselheiro é Aluno 2
('44444444444', 'Diego Nunes', '1994-11-11', 'Doutorado em Redes', 4, 1), -- Aluno 4, conselheiro é Aluno 1
('55555555555', 'Elisa Martins', '1998-09-09', 'Mestrado em IA', 1, 3);    -- Aluno 5, conselheiro é Aluno 3

INSERT INTO projeto (financiador, data_inicio, data_fim, orcamento, prof_pesquisador) VALUES
('CNPQ', '2023-01-01', '2024-12-31', 150000.00, 1), -- Pesquisador Principal: Dr. João Silva
('FAPESP', '2023-06-01', '2025-05-31', 200000.00, 2), -- Pesquisador Principal: Dra. Maria Souza
('CAPES', '2024-03-01', '2026-02-28', 120000.00, 3), -- Pesquisador Principal: Dr. Pedro Santos
('FINEP', '2023-09-01', '2025-08-31', 180000.00, 1), -- Pesquisador Principal: Dr. João Silva
('MCTI', '2024-01-15', '2026-01-14', 90000.00, 4);  -- Pesquisador Principal: Dra. Ana Costa

INSERT INTO departamento_has_professor (departamento_iddepartamento, professor_idprofessor, porcentagem_tempo) VALUES
(1, 1, 0.80), -- Dr. João Silva em Ciência da Computação (80%)
(1, 2, 0.50), -- Dra. Maria Souza em Ciência da Computação (50%)
(2, 2, 0.50), -- Dra. Maria Souza em Engenharia Elétrica (50%)
(3, 3, 0.90), -- Dr. Pedro Santos em Matemática Aplicada (90%)
(1, 5, 0.70); -- Dr. Carlos Oliveira em Ciência da Computação (70%)

INSERT INTO professor_has_projeto (professor_idprofessor, projeto_idprojeto) VALUES
(1, 1), -- Dr. João Silva é copesquisador no Projeto 1 (além de principal)
(2, 1), -- Dra. Maria Souza é copesquisadora no Projeto 1
(1, 2), -- Dr. João Silva é copesquisador no Projeto 2
(3, 2), -- Dr. Pedro Santos é copesquisador no Projeto 2
(4, 5); -- Dra. Ana Costa é copesquisadora no Projeto 5 (além de principal)

INSERT INTO projeto_has_aluno (projeto_idprojeto, aluno_idaluno, prof_supervisor) VALUES
(1, 1, 1), -- Projeto 1, Aluno 1, Supervisor: Dr. João Silva
(1, 2, 2), -- Projeto 1, Aluno 2, Supervisor: Dra. Maria Souza
(2, 3, 2), -- Projeto 2, Aluno 3, Supervisor: Dra. Maria Souza
(3, 4, 3), -- Projeto 3, Aluno 4, Supervisor: Dr. Pedro Santos
(1, 5, 1); -- Projeto 1, Aluno 5, Supervisor: Dr. João Silva