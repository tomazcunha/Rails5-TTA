namespace :dev do

  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')
    # File.join = Usa o separador de diretório do sist. operacional (linux '/', windows '\').
    # Rails.root = Retorna o caminho relativo até a rails do projeto rails.
    # resultado = /home/tomaz19/1_Tomaz/Projetos/0_tom-ruby-on-rails/modulo_05/time_to_answer/lib/tmp/

  desc "Configurar o ambiente de desenvolvimento"
  task setup: :environment do

    if Rails.env.development?
      show_spinner("Apagando DB..."){ %x(rails db:drop) }
      show_spinner("Criando DB..."){ %x(rails db:create) }
      show_spinner("Migrando DB..."){ %x(rails db:migrate) }
      show_spinner("Cadastrando o administrador padrão..."){ %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando administradores extras..."){ %x(rails dev:add_extra_admins) }
      show_spinner("Cadastrando o usuário padrão..."){ %x(rails dev:add_default_user) }
      show_spinner("Cadastrando o assuntos padrões..."){ %x(rails dev:add_subjects) }
      show_spinner("Cadastrando perguntas e respostas..."){ %x(rails dev:add_answers_and_questions) }

      # %x(rails dev:add_mining_types)

    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD)
  end

  desc "Adiciona administradores extras"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD)
    end
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD)
  end

  desc "Adiciona assuntos padrões"
  task add_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end
  end

  desc "Adiciona perguntas e respostas"
  task add_answers_and_questions: :environment do
    Subject.all.each do |subject|
      rand(5..10).times do |i|  # times vai contar as vezes entre 5 e 10. 'i' não é usado.

        # criando uma questão
        params = { question: {
          description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
          subject: subject,
          answers_attributes: []
        }}

        # criando respostas para essa questão
        rand(2..5).times do |j|
          params[:question][:answers_attributes].push(
            { description: Faker::Lorem.sentence, correct: false }
          )
        end

        # quantas respostas foram?
        index = rand(params[:question][:answers_attributes].size)

        # true para uma destas respostas
        params[:question][:answers_attributes][index] = { description: Faker::Lorem.sentence, correct: true }

        # terminda de gravar a questão
        Question.create!(params[:question])

      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start} ...")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end

end
