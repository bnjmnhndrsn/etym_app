def rand_c 
  ('a'..'z').to_a[rand(26)]
end

def rand_s(num)
  (0..num).map { rand_c }.join
end

def mutate_string(string, num)
  arr = string.split("")
  
  num.times do
   arr[rand(string.length)] = rand_c
  end
  
  arr.join("")
end


namespace :db do
  desc "Fill database with fake data"
  task populate: :environment do
    10.times do |n|
      headword  = rand_s(6)
      lang = rand_s(2)
      Etymology.create!(headword: headword, lang: lang)
    end
    
    Etymology.all.each do |e|
      cur_word = e.headword
      5.times do
        e.words.create!(content: cur_word, lang: rand_s(2))
        cur_word = mutate_string(cur_word, rand(2) + 1)
      end
    end
    
  end
end