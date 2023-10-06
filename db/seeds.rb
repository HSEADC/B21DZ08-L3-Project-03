def seed
  reset_db
  create_profiles(10)
  create_posts(2..8)
end

@raw_text = 'Дом Наркомфина — один из знаковых памятников архитектуры советского авангарда и конструктивизма. Построен в 1928—1930 годах по проекту архитекторов Моисея Гинзбурга, Игнатия Милиниса и инженера Сергея Прохорова для работников Народного комиссариата финансов СССР (Наркомфина). Автор замысла дома Наркомфина Гинзбург определял его как «опытный дом переходного типа». Дом находится в Москве по адресу: Новинский бульвар, дом 25, корпус 1. С начала 1990-х годов дом находился в аварийном состоянии, был трижды включён в список «100 главных зданий мира, которым грозит уничтожение». В 2017—2020 годах отреставрирован по проекту АБ «Гинзбург Архитектс», функционирует как элитный жилой дом. Отдельно стоящий «Коммунальный блок» (историческое название) планируется как место проведения публичных мероприятий.'
@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_sentence
  sentence_words = []

  (1..3).to_a.sample.times do
    sentence_words << @words.sample
  end

  sentence = sentence_words.join(' ').capitalize + '.'
end

def upload_random_image
  uploader = PostImageUploader.new(Post.new, :pic)
  uploader = PostImageUploader.new(Profile.new, :profile_pic)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/posts', '*')).sample))
  uploader
end


def create_profiles(quantity)
  quantity.times do
    profile = Profile.create(nick_name: "Пользователь ADC ##{rand(100)}", description: create_sentence, location: "МСК", profile_pic: upload_random_image)
    puts "Post with id #{profile.id}"
  end
end

def create_posts(quantity)
  Profile.all.each do |profile|
    quantity.to_a.sample.times do
      post = Post.create(profile_id: profile.id, post_name: create_sentence, description: create_sentence, pic: upload_random_image)
      puts "Post with id #{post.id} создали короче для профиля с id #{post.profile.id}"
    end
  end
end


seed