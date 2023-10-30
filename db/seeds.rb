@raw_text = "Дом Наркомфина — один из знаковых памятников архитектуры советского авангарда и конструктивизма. Построен в 1928—1930 годах по проекту архитекторов Моисея Гинзбурга, Игнатия Милиниса и инженера Сергея Прохорова для работников Народного комиссариата финансов СССР (Наркомфина). Автор замысла дома Наркомфина Гинзбург определял его как «опытный дом переходного типа». Дом находится в Москве по адресу: Новинский бульвар, дом 25, корпус 1. С начала 1990-х годов дом находился в аварийном состоянии, был трижды включён в список «100 главных зданий мира, которым грозит уничтожение». В 2017—2020 годах отреставрирован по проекту АБ «Гинзбург Архитектс», функционирует как элитный жилой дом. Отдельно стоящий «Коммунальный блок» (историческое название) планируется как место проведения публичных мероприятий."
@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')
def seed
    reset_db
    create_admin
    create_users
    create_profiles(30)
    create_posts(2, 8)
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
# puts words
def create_profiles(quantity)
    quantity.times do
        user = User.all.sample
        profile = Profile.create(description: create_sentence(10, 20), nick_name: create_sentence(1, 2), user_id: user.id)
        puts "Profile with id #{profile.id}"
    
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
        post = Post.create(profile_id: profile.id, description: create_sentence(20, 40), pic: upload_random_image,user_id: user.id)
        puts "Post with id #{post.id} associated with profile id #{post.profile.id}"
    end
end
end
seed