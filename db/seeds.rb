@raw_text = "Дом Наркомфина — один из знаковых памятников архитектуры советского авангарда и конструктивизма. Построен в 1928—1930 годах по проекту архитекторов Моисея Гинзбурга, Игнатия Милиниса и инженера Сергея Прохорова для работников Народного комиссариата финансов СССР (Наркомфина). Автор замысла дома Наркомфина Гинзбург определял его как «опытный дом переходного типа». Дом находится в Москве по адресу: Новинский бульвар, дом 25, корпус 1. С начала 1990-х годов дом находился в аварийном состоянии, был трижды включён в список «100 главных зданий мира, которым грозит уничтожение». В 2017—2020 годах отреставрирован по проекту АБ «Гинзбург Архитектс», функционирует как элитный жилой дом. Отдельно стоящий «Коммунальный блок» (историческое название) планируется как место проведения публичных мероприятий."
@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')
def create_sentence(x, y)
    sentence_words = []
    (x..y).to_a.sample.times do
        sentence_words << @words.sample
      end
      sentence = sentence_words.join(' ').capitalize + '.'
end
# puts words

100.times do
    profile = Profile.create(description: create_sentence(10, 20), nick_name: create_sentence(1, 2))
    puts "Profile with id #{profile.id}"

end
profiles = Profile.all

profiles.each do |profile|
    (2..5).to_a.sample.times do
        post = Post.create(profile_id: profile.id, description: create_sentence(20, 40))
        puts "Post with id #{post.id} associated with profile id #{post.profile.id}"
    end
end