# Modelagem de Banco de Dados para um Sistema Acadêmico Universitário

## Enunciado 
Neste link consta o enunciado do exercício proposto. O link foi retirado da internet.
![Enunciado do erxerício](https://github.com/andreborile/modelagem-banco-dados/blob/main/src/exercicio_modelagem.pdf)

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

![modelagem_universidade.png](https://github.com/andreborile/modelagem-banco-dados/blob/main/img/der_universidade.png)

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
        
## 3. Implementação do Esquema (DDL)

A partir do ERD, o script SQL para a criação das tabelas (Data Definition Language - DDL) foi gerado. Este script inclui a definição das colunas, tipos de dados, chaves primárias e chaves estrangeiras, garantindo a integridade referencial do banco de dados.

![Arquivo DDL](https://github.com/andreborile/modelagem-banco-dados/blob/main/src/ddl.sql)

## 4. Inserção de Dados (DML)

Para popular o banco de dados e permitir testes, foram criados 5 registros para cada tabela, incluindo as tabelas de junção. Isso demonstra a capacidade de manipular os dados de acordo com o esquema definido.

![Arquivo DML](https://github.com/andreborile/modelagem-banco-dados/blob/main/src/dml.sql)

## 5. Demonstração de Queries SQL

Para demonstrar a funcionalidade e a capacidade de extração de informações do banco de dados modelado, foram elaboradas algumas queries SQL. Estas consultas exemplificam como é possível interrogar o banco de dados para obter insights complexos e relevantes sobre as operações da universidade.
Exemplo de Query: Departamentos Ativos e Seus Recursos Humanos (Professores e Alunos)

    Objetivo: Esta query visa fornecer uma visão holística dos departamentos da universidade, listando o nome de cada departamento, seu escritório principal, o nome do professor que atua como chefe do departamento, e a contagem total de professores que trabalham naquele departamento (independentemente da porcentagem de tempo), bem como o número de alunos de pós-graduação que o têm como seu departamento principal.

    Demonstração: Esta consulta agrega dados de diferentes entidades (departamento, professor, departamento_has_profess, aluno) para apresentar um resumo consolidado dos recursos humanos associados a cada departamento, destacando a eficiência da modelagem para consultas complexas.

![Query Select](https://github.com/andreborile/modelagem-banco-dados/blob/main/src/select.sql)

![Resultado Select](https://github.com/andreborile/modelagem-banco-dados/blob/main/img/select.png)

## ✅ Resultado

O resultado deste trabalho é um modelo de banco de dados relacional completo e funcional, aderente aos requisitos complexos de um sistema universitário. O ERD demonstra uma compreensão sólida da modelagem de dados, incluindo a correta aplicação de normalização e o uso de tabelas de junção para relações N:M, bem como auto-relacionamentos.

A implementação em SQL (DDL e DML) prova a capacidade de transpor o modelo conceitual e lógico para um esquema físico de banco de dados e popular este esquema com dados de exemplo, confirmando a integridade e a capacidade de armazenamento das informações.

Este projeto serve como uma base robusta para o desenvolvimento futuro de aplicações que necessitem gerenciar dados universitários, garantindo a consistência e a organização das informações.

## 💡 Conclusão

A realização deste projeto reforçou a importância da fase de modelagem no ciclo de vida do desenvolvimento de sistemas. A análise cuidadosa dos requisitos e a construção iterativa do ERD foram cruciais para a criação de um esquema de banco de dados eficiente e sem redundâncias. A capacidade de representar relações complexas, como múltiplos papéis para uma mesma entidade (ex: professor como chefe, pesquisador principal e copesquisador) e atributos de relacionamento (ex: porcentagem de tempo e supervisor por projeto-aluno), é fundamental para a flexibilidade e escalabilidade do sistema.

### Este projeto demonstra proficiência em:

    Análise de requisitos para modelagem de dados.
    Criação de Diagramas Entidade-Relacionamento (ERD) no MySQL Workbench.
    Compreensão e aplicação de conceitos de normalização.
    Geração de scripts DDL para criação de tabelas e definição de chaves.
    Elaboração de scripts DML para inserção de dados.
    Desenvolvimento e aplicação de consultas SQL complexas para extração e análise de dados estratégicos.
