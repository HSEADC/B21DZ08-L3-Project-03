def seed
#   reset_db
#   create_profile(10)
end
@raw_text = 'Дом Наркомфина — один из знаковых памятников архитектуры советского авангарда и конструктивизма. Построен в 1928—1930 годах по проекту архитекторов Моисея Гинзбурга, Игнатия Милиниса и инженера Сергея Прохорова для работников Народного комиссариата финансов СССР (Наркомфина). Автор замысла дома Наркомфина Гинзбург определял его как «опытный дом переходного типа». Дом находится в Москве по адресу: Новинский бульвар, дом 25, корпус 1. С начала 1990-х годов дом находился в аварийном состоянии, был трижды включён в список «100 главных зданий мира, которым грозит уничтожение». В 2017—2020 годах отреставрирован по проекту АБ «Гинзбург Архитектс», функционирует как элитный жилой дом. Отдельно стоящий «Коммунальный блок» (историческое название) планируется как место проведения публичных мероприятий.'
@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

def create_sentence
  sentence_words = []

  (1..3).to_a.sample.times do
    sentence_words << @words.sample
  end

  sentence = sentence_words.join(' ').capitalize + '.'
end

100.times do
  profile = Profile.create(nick_name: create_sentence, description: create_sentence)
  puts "Profile with id #{profile.id} and nickname #{profile.nick_name}just created"
end
profiles = Profile.all
profiles.each do |profile|
    post = Post.create(profile_id: profile.id, post_name: create_sentence)
    puts post "Post with id #{post.id} for profile with id #{post.profile.id}just created"
end
# def reset_db
#   Rake::Task['db:drop'].invoke
#   Rake::Task['db:create'].invoke
#   Rake::Task['db:migrate'].invoke
# end

# def create_users
# end
# def create_profiles(quantity)
#     quantity.times { create_profile }
# end
# def create_profile
#     profile = profile.create(nick_name: "Profile #{100..999}.to_a.sample")
#     puts "Profile with id #{profile.id} and nickname: #{profile.nick_name} has been just created"
# end
# def create_posts
#     post = post.create(post.id)
#     puts "Post with id #{post.id} has been created"
# end

seed