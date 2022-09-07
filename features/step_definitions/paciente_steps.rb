Given('eu estou na pagina de criar novo paciente') do
  visit '/pacientes/new'
  expect(page).to have_current_path('/pacientes/new')
end

When('eu crio um paciente com o nome {string}, a data de nascimento {string}, o cpf {string}, o email {string}, o cep {string}, a cidade {string}, o bairro {string}, o logradouro {string} e o complemento {string}') do |nome, dataDeNascimento, cpf, email, cep, cidade, bairro, logradouro, complemento|
  fill_in 'paciente[nome]', :with => nome
  fill_in 'paciente[data_nascimento]', :with => dataDeNascimento
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => email
  fill_in 'paciente_endereco_attributes_cep', :with => cep
  fill_in 'paciente_endereco_attributes_cidade', :with => cidade
  fill_in 'paciente_endereco_attributes_bairro', :with => bairro
  fill_in 'paciente_endereco_attributes_logradouro', :with => logradouro
  fill_in 'paciente_endereco_attributes_complemento', :with => complemento
end

When('eu clico em criar paciente') do
  click_button 'Create Paciente'
end

Then ('eu vejo uma mensagem de confirmacao de criacao') do
  expect(page).to have_text("successfully")
end
