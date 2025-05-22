SELECT
    d.nome AS NomeDepartamento,
    d.escritorio AS EscritorioPrincipal,
    pc.nome AS ChefeDepartamento,
    COUNT(DISTINCT dhp.professor_idprofessor) AS TotalProfessoresTrabalhando,
    COUNT(DISTINCT a.idaluno) AS TotalAlunosAssociados
FROM
    departamento AS d
LEFT JOIN
    professor AS pc ON d.prof_chefe_dpto = pc.idprofessor
LEFT JOIN
    departamento_has_profess AS dhp ON d.iddepartamento = dhp.departamento_iddepartamento
LEFT JOIN
    aluno AS a ON d.iddepartamento = a.departamento_iddepartamento
GROUP BY
    d.iddepartamento, d.nome, d.escritorio, pc.nome
ORDER BY
    TotalAlunosAssociados DESC, TotalProfessoresTrabalhando DESC;
