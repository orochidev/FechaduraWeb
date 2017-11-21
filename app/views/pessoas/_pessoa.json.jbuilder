if pessoa.type == "Aluno"
  json.partial! 'alunos/aluno', aluno: pessoa
elsif pessoa.type == "Professor"
  json.partial! 'professores/professor', professor: pessoa
elsif pessoa.type == "Servidor"
  json.partial! 'servidores/servidor', servidor: pessoa
end
