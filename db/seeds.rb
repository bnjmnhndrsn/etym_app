examples = [
  [
    {content: "mouse", lang: "en"},
    {content: "mous", lang: "enm"},
    {content: "mūs", lang: "ang"},
    {content: "mūs", lang: "gem-pro"},
    {content: "muh₂s", lang: "ine-pro"}
  ],
  [
    {content: "cook", lang: "en"},
    {content: "cook", lang: "enm"},
    {content: "cōc", lang: "ang"},
    {content: "kukaz", lang: "gem-pro"}
  ],
  [
    {content: "sky", lang: "en"},
    {content: "sky", lang: "enm"},
    {content: "ský", lang: "non"},
    {content: "skiwją", lang: "gem-pro"},
    {content: "(s)k(')ew-", lang: "ine-pro"}
  ]
]

File.readlines("./lib/assets/language_codes.tsv").each_with_index do |line, i|
  begin
    code, name = line.chomp.split("\t")
    Language.create!(code: code, name: name)
  rescue
    p i
    p line
  end
end

examples.each do |arr|
  headword  = arr[0][:content]
  lang = arr[0][:lang]
  etym = Etymology.create!(headword: headword, language_code: lang)
  
  arr.each_with_index do |entry, i|
    word = Word.create!(content: entry[:content], language_code: entry[:lang])
    
    WordEtymology.join_word_to_etymology!(word, etym, i)
  end
  
end