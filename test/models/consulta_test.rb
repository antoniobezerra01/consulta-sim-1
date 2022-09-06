require "test_helper"

class ConsultaTest < ActiveSupport::TestCase

  test 'deveria salvar uma consulta com atributos preenchidos corretamente' do
    paciente = Paciente.new(nome: 'Antonio Bezerra', data_nascimento: '18-03-2002', cpf: '61081490004', email: 'antonio_@gmail.com')
    paciente.endereco = Endereco.new(cep: '12345-678', cidade: 'Garanhuns', bairro: 'Magano', logradouro: 'rua x', complemento: 'casa x')
    assert paciente.save

    medico = Medico.new(nome:'Antonio Silva', cpf:'15151805061', email:'antoniosilva@gmail.com', especialidade:'cirugião', crm:'12345')
    assert medico.save

    consulta = Consulta.new(data:'20-02-2023', horario:"14:00", medico_id: medico.id, paciente_id: paciente.id)
    assert consulta.save
  end

  test "deveria atualizar uma consulta com uma data e um horario novo" do
    paciente = Paciente.new(nome: 'Antonio Bezerra', data_nascimento: '18-03-2002', cpf: '61081490004', email: 'antonio_@gmail.com')
    paciente.endereco = Endereco.new(cep: '12345-678', cidade: 'Garanhuns', bairro: 'Magano', logradouro: 'rua x', complemento: 'casa x')
    assert paciente.save

    medico = Medico.new(nome:'Antonio Silva', cpf:'15151805061', email:'antoniosilva@gmail.com', especialidade:'cirugião', crm:'12345')
    assert medico.save

    consulta = Consulta.new(data:'20-02-2023', horario:"14:00", medico_id: medico.id, paciente_id: paciente.id)
    assert consulta.save

    assert consulta.update(data: '25-03-2023', horario: '08:00', medico_id: medico.id, paciente_id: paciente.id)
  end
end
