Feature: Paciente
  As a usuario do sistema
  I want to adicionar e remover paciente
  So that eu nao tenho que fazer isso manualmente

  Scenario: criar um paciente corretamente
    Given eu estou na pagina de criar novo paciente
    When eu crio um paciente com o nome 'Antonio Bezerra', a data de nascimento '2002-03-18', o cpf '16372131072', o email 'antonio_@gmail.com', o cep '12345-678', a cidade 'Garanhuns', o bairro 'Magano', o logradouro 'Rua x' e o complemento 'Casa C'
    And eu clico em criar paciente
    Then eu vejo uma mensagem de confirmacao de criacao

  Scenario: remover um paciente existente
    Given o paciente com o nome 'Antonio Bezerra', a data de nascimento '2002-03-18', o CPF '16372131072', o email 'antonio_@gmail.com', o CEP '12345-678', a cidade 'Garanhuns', o bairro 'Magano', o logradouro 'Rua x' e o complemento: 'Casa C' existe
    And eu estou na pagina de paciente que deve ser deletado
    When eu clico em remover o paciente com o nome 'Antonio Bezerra'
    Then eu vejo uma mensagem que informa que o paciente foi removido com sucesso