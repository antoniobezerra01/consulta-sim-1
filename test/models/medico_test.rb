require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test 'criando medico corretamente' do
    medico = Medico.new nome: 'Rodrigo Andrade', cpf: '706.508.980-01', email: 'rodrigo@rodrigo.com',
                        especialidade: 'Reumatologista', crm: '123456'
    assert medico.save
  end

  test "nao deveria atualizar um medico com CPF invalido" do
    medico = Medico.new(nome:'Antonio Silva', cpf:'15151805061', email:'antoniosilva@gmail.com', especialidade:'cirugião', crm:'12345')
    assert medico.save
    assert_not medico.update(nome:'Antonio Silva', cpf:'12345678900', email:'antoniosilva@gmail.com', especialidade:'cirugião', crm:'12345')
  end

  test "nao deveria criar um medico com email invalido" do
    medico = Medico.new(nome:'Antonio Silva', cpf:'15151805061', email:'antoniosilva', especialidade:'cirugião', crm:'12345')
    assert_not medico.save
  end
end
