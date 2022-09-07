Feature: Consulta
  As a paciente
  I want to editar uma consulta
  So that eu nao tenha que fazer essa acao manualmente

  Scenario: editar data e hora de uma consulta corretamente
    Given eu estou no sistema com o nome 'Antonio Bezerra', a data de nascimento '2002-03-18', o cpf '16372131072' e o email 'antonio_@gmail.com'
    And existe um medico com o nome 'Eduardo Bezerra', o cpf '01494591065', o email 'eduardo@gmail.com', o numero Crm '12345'
    And existe uma consulta com o medico 'Eduardo Bezerra' e o paciente 'Antonio Bezerra', na data '2023-02-10' e o horario '10:00'
    When eu estou na pagina de consultas
    And eu edito uma consulta de 'Antonio Bezerra' com o medico 'Eduardo Bezerra' para a data '2023-03-01' e o horario '14:00'
    And eu clico em atualizar uma consulta
    Then eu vejo uma mensagem de confirmacao de edicao

  Scenario: editar consulta com dia em branco
    Given eu estou no sistema com o nome 'Antonio Bezerra', a data de nascimento '2002-03-18', o cpf '16372131072' e o email 'antonio_@gmail.com'
    And existe um medico com o nome 'Eduardo Bezerra', o cpf '01494591065', o email 'eduardo@gmail.com', o numero Crm '12345'
    And existe uma consulta com o medico 'Eduardo Bezerra' e o paciente 'Antonio Bezerra', na data '2023-02-10' e o horario '14:00'
    When eu estou na pagina de consultas
    And eu edito uma consulta de 'Antonio Bezerra' com o medico 'Eduardo Bezerra' para a data '' e o horario '10:00'
    And eu clico em atualizar uma consulta
    Then eu vejo uma mensagem de erro de edicao