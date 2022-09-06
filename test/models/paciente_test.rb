require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test 'nao deveria salvar um paciente com atributos nulos' do
    paciente = Paciente.new
    assert_not paciente.save
  end

  test 'deveria salvar um paciente com atributos preenchidos corretamente' do
    paciente = Paciente.new(nome: 'Antonio Bezerra', data_nascimento: '18-03-2002', cpf: '61081490004', email: 'antonio_@gmail.com')
    paciente.endereco = Endereco.new(cep: '12345-678', cidade: 'Garanhuns', bairro: 'Magano', logradouro: 'rua x', complemento: 'casa x')
    assert paciente.save
  end
end
