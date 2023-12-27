@raw_text = "Дом Наркомфина — один из знаковых памятников архитектуры советского авангарда и конструктивизма. Построен в 1928—1930 годах по проекту архитекторов Моисея Гинзбурга, Игнатия Милиниса и инженера Сергея Прохорова для работников Народного комиссариата финансов СССР (Наркомфина). Автор замысла дома Наркомфина Гинзбург определял его как «опытный дом переходного типа». Дом находится в Москве по адресу: Новинский бульвар, дом 25, корпус 1. С начала 1990-х годов дом находился в аварийном состоянии, был трижды включён в список «100 главных зданий мира, которым грозит уничтожение». В 2017—2020 годах отреставрирован по проекту АБ «Гинзбург Архитектс», функционирует как элитный жилой дом. Отдельно стоящий «Коммунальный блок» (историческое название) планируется как место проведения публичных мероприятий."
@companies = [
  "Yandex", "VK", "Mail.Ru Group", "Kaspersky Lab", "Avito",
  "Tinkoff Bank", "Sberbank Technology", "ABBYY", "1C Company", "Rambler",
  "Gazprom Neft", "Luxoft", "EPAM Systems", "Rozum Robotics",
  "Game Insight", "Nival", "JetBrains", "Qiwi", "Parallels", "Skolkovo Foundation",
  "Alawar Entertainment", "Acronis", "Crello", "Auriga", "IT Territory",
  "Playrix", "Ivideon", "Reksoft", "Artezio", "Axmor Software",
  "SimbirSoft", "iSpring Solutions", "Badoo", "G5 Entertainment", "Herocraft",
  "ZYTOV Design Studio", "Art. Lebedev Studio", "Redmadrobot", "FIRMA Agency", "Heads and Hands", "HSE ART AND DESIGN", "ГК Самолет"
]

@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')
def seed
    reset_db
    create_admin
    create_users
    fill_profiles
    create_posts(2, 8)
    create_post_replies(500, 1000)
    create_vacancies(100)
  end
def reset_db
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
end
def create_sentence(x, y)
    sentence_words = []
    (x..y).to_a.sample.times do
        sentence_words << @words.sample
      end
      sentence = sentence_words.join(' ').capitalize + '.'
end
def upload_random_image
  uploader = PostImageUploader.new(Post.new, :pic)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/posts', '*')).sample))
  uploader
end
def upload_random_image
  uploader = PostImageUploader.new(Profile.new, :profile_pic)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/posts', '*')).sample))
  uploader
end
def fill_profiles
  User.all.each do |user|
    profile = user.profile
    profile.update(description: create_sentence(1, 3), nick_name: create_sentence(1, 2), profile_pic: upload_random_image)
    puts "Profile with id #{profile.id} associated with user id #{user.id}"
  end
end
def create_admin
    user_data = {
        email: "admin@email.com",
        password: 'testtest',
        admin: "true"
      }
  
      user = User.create!(user_data)
      puts "Admin created with id #{user.id}"
end
def create_users
    i = 0
  
    10.times do
      user_data = {
        email: "user_#{i}@email.com",
        password: 'testtest'
      }
  
      user = User.create!(user_data)
      puts "User created with id #{user.id}"
  
      i += 1
    end
  end
def create_posts(x, y)
    user = User.all.sample
    Profile.all.each do |profile|
      (x..y).to_a.sample.times do
          post = Post.create(profile_id: profile.id, description: create_sentence(2, 5), post_title: create_sentence(1, 1), pic: upload_random_image,user_id: user.id)
          puts "Post with id #{post.id} associated with profile id #{post.profile.id}"
      end
    end
end
def create_vacancies(quantity)
  quantity.times do |x|
    x = EmploymentOpportunity.create(
      title: create_sentence(1, 1),
      vacancy_type: ["part-time", "intern", "full-time"].sample,
      user_id: User.all.sample.id,
      status: ["open", "closed"].sample,
      application_deadline: Date.today + rand(30).days,
      description: create_sentence(20, 25),
      location: create_sentence(1, 2),
      company_name: @companies.sample,
      work_environment: create_sentence(1, 2))
      puts "Employment opportunity with id #{x.id} has been created"
  end
end
def create_post_replies(x, y)
    (x..y).to_a.sample.times do
      user = User.all.sample
      post = Post.all.sample
      reply = post.replies.create(profile_id: post.profile_id, user_id: user.id, description: create_sentence(2, 5))
      puts "Post reply with id #{reply.id} associated with post id #{post.id}"
    end
    # Profile.all.each do |profile|
    # (x..y).to_a.sample.times do
    #     post = Post.create(profile_id: profile.id, description: create_sentence(2, 5), post_title: create_sentence(1, 1), pic: upload_random_image,user_id: user.id)
    #     puts "Post with id #{post.id} associated with profile id #{post.profile.id}"
    # end
end
seed