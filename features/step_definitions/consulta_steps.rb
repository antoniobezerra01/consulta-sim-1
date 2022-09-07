Given('eu estou no sistema com o nome {string}, a data de nascimento {string}, o cpf {string} e o email {string}') do |nome, data_nascimento, cpf, email|
  visit '/pacientes/new'
  expect(page).to have_current_path('/pacientes/new')
  fill_in 'paciente[nome]', :with => nome
  fill_in 'paciente[data_nascimento]', :with => data_nascimento
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => email
  fill_in 'Cep',	with: '12345-678'
  fill_in 'Cidade', with: 'Garanhuns'
  fill_in 'Bairro', with: 'Magano'
  fill_in 'Logradouro', with: 'Rua x'
  fill_in 'Complemento', with: 'Casa C'
  click_button 'Create Paciente'
  expect(page).to have_current_path('/pacientes' + '/' + Paciente.last.id.to_s)
end

Given('existe um medico com o nome {string}, o cpf {string}, o email {string}, o numero Crm {string}') do |nome, cpf, email, crm|
  visit '/medicos/new'
  fill_in 'medico[nome]', :with => nome
  fill_in 'medico[crm]', :with => crm
  fill_in 'medico[cpf]', :with => cpf
  fill_in 'medico[email]', :with => email
  fill_in 'medico[especialidade]', :with => 'Cirugião'
  click_button 'Create Medico'
  expect(page).to have_current_path('/medicos' + '/' + Medico.last.id.to_s)
end

Given('existe uma consulta com o medico {string} e o paciente {string}, na data {string} e o horario {string}') do |medico, paciente, data, hora|
  visit '/consultas/new'
  fill_in 'consulta[data]', :with => data
  select hora, from:'consulta_horario'
  select paciente, from: 'consulta_paciente_id'
  select medico, from: 'consulta_medico_id'
  click_button 'Create Consulta'
  expect(page).to have_current_path('/consultas' + '/' + Consulta.last.id.to_s)
end

When('eu estou na pagina de consultas') do
  visit '/consultas'
  expect(page).to have_current_path('/consultas')
end

When('eu edito uma consulta de {string} com o medico {string} para a data {string} e o horario {string}') do |paciente, medico,data, hora|
  visit '/consultas/' + Consulta.last.id.to_s + '/edit'
  expect(page).to have_current_path('/consultas/' + Consulta.last.id.to_s + '/edit')
  fill_in 'consulta[data]', :with => data
  select hora, from:'consulta_horario'
  select paciente, from: 'consulta_paciente_id'
  select medico, from: 'consulta_medico_id'
end

When('eu clico em atualizar uma consulta') do
  click_button 'Update Consulta'
end

Then('eu vejo uma mensagem de confirmacao de edicao') do
  expect(page).to have_text("successfully")
end
