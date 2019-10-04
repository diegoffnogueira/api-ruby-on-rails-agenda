namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  puts 'Cadastrando os tipos de contatos...'
  task setup: :environment do
    kinds = %w[Amigo Comercial Conhecido]
    kinds.each do |kind|
      Kind.create!(
          description: kind
      )
    end
  end
  puts 'Tipos de contatos cadastrados com sucesso!'

  ###############################

  puts 'Cadastrando os contatos...'
  task setup: :environment do
    100.times do |_i|
      Contact.create!(name: Faker::Name.name,
                      email: Faker::Internet.email,
                      birthdate: Faker::Date.between(from: 35.years.ago,
                                                     to: 18.years.ago),
                      kind: Kind.all.sample)
    end
  end
  puts 'Contatos cadastrados com sucesso!'

end
