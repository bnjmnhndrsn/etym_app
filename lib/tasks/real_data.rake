examples = [
  [
    {content: "mouse", lang: "en"},
    {content: "mous", lang: "men"},
    {content: "mūs", lang: "oen"},
    {content: "mūs", lang: "pre-gr"},
    {content: "muh₂s", lang: "pre-ie"}
  ],
  [
    {content: "cook", lang: "en"},
    {content: "cook", lang: "men"},
    {content: "cōc", lang: "oen"},
    {content: "kukaz", lang: "pre-gr"}
  ],
  [
    {content: "sky", lang: "en"},
    {content: "sky", lang: "men"},
    {content: "ský", lang: "nrs"},
    {content: "skiwją", lang: "pre-gr"},
    {content: "(s)k(')ew-", lang: "pre-ie"}
  ]
]

namespace :db do
  desc "Fill database with real data"
  task populate_real: :environment do
    examples.each do |arr|
      headword  = arr[0][:content]
      lang = arr[0][:lang]
      etym = Etymology.create!(headword: headword, lang: lang)
      
      arr.each do |word|
        etym.words.create!(content: word[:content], lang: word[:lang])
      end
      
    end

  end
end