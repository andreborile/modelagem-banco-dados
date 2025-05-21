# Modelagem de Banco de Dados para um Sistema Acadêmico Universitário

## 📝 Introdução

Este projeto consiste na modelagem de um banco de dados relacional para gerenciar informações de uma universidade, abrangendo professores, projetos de pesquisa, alunos de pós-graduação e departamentos. O objetivo principal é demonstrar as habilidades em design de bancos de dados, utilizando os princípios da modelagem Entidade-Relacionamento (ERD) e a linguagem SQL para a criação das estruturas e inserção de dados.

O foco é construir um esquema de banco de dados que seja eficiente, normalizado e capaz de representar as complexas relações existentes em um ambiente universitário, como a colaboração de professores e alunos em múltiplos projetos, a hierarquia de chefia de departamento, e a supervisão de alunos em projetos específicos.

## 🚀 Desenvolvimento

Esta seção detalha o processo de criação do banco de dados, desde a análise dos requisitos até a implementação das tabelas e a inserção de dados.
### 1. Análise de Requisitos

Os requisitos iniciais e as iterações de complexidade crescente foram cuidadosamente analisados para identificar as entidades, seus atributos e os relacionamentos entre elas. Os requisitos foram:

    Professores: CPF, nome, data de nascimento, posição, especialidade de pesquisa.
    Projetos: Número de projeto, nome do financiador, data inicial, data final, orçamento.
    Estudantes de Pós-Graduação: CPF, nome, data de nascimento, programa de pós-graduação.
    Relação Professor-Projeto (Gerenciamento): Cada projeto gerenciado por um professor (pesquisador principal).
    Relação Professor-Projeto (Copesquisadores): Cada projeto conduzido por um ou mais professores (copesquisadores), com professores podendo trabalhar em múltiplos projetos.
    Relação Projeto-Aluno (Assistentes de Pesquisa e Supervisão): Cada projeto conduzido por um ou mais alunos. Cada aluno deve ter um professor supervisor para seu trabalho nesse projeto, e alunos podem trabalhar em múltiplos projetos com supervisores potencialmente diferentes para cada projeto.
    Departamentos: Número de departamento, nome, escritório principal.
    Relação Departamento-Professor (Chefia): Cada departamento administrado por um professor (chefe do departamento).
    Relação Departamento-Professor (Alocação de Trabalho): Professores trabalham em um ou mais departamentos, com uma porcentagem de tempo associada a cada departamento.
    Relação Aluno-Departamento: Alunos de pós-graduação têm um departamento principal.
    Relação Aluno-Aluno (Conselheiro): Cada estudante tem um outro estudante mais experiente como conselheiro.

### 2. Modelagem Entidade-Relacionamento (ERD)

Com base nos requisitos, foi construído um diagrama Entidade-Relacionamento (ERD) utilizando o MySQL Workbench. Este diagrama representa as entidades, seus atributos e os tipos de relacionamentos (1:1, 1:N, N:M), incluindo a identificação de chaves primárias e estrangeiras.

O diagrama final, após várias iterações e refinamentos para acomodar todos os requisitos, é apresentado a seguir:

modelagem_universidade.png
(Certifique-se de que a imagem esteja no repositório e o link seja correto)

    Entidades:
        professor
        projeto
        aluno
        departamento
    Tabelas de Junção (para relações N:M e atributos de relacionamento):
        professor_has_projeto (para copesquisadores)
        projeto_has_aluno (para assistentes de pesquisa e seus supervisores específicos por projeto)
        departamento_has_profess (para alocação de tempo de professores em departamentos)
    Auto-Relacionamento:
        aluno.conselheiro (para o conselheiro de cada aluno)
