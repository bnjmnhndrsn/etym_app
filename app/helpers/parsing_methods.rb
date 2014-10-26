module ParsingMethods
  require 'open-uri'
  require 'JSON'
  
  def load_wiki_page(word)
    url = "http://en.wiktionary.org/w/api.php?" +
    "format=json&action=query&titles=#{CGI.escape(word)}&prop=revisions&rvprop=content"
    hash = JSON(open(url).read)
    
    unless hash.empty?
      pages = hash["query"]["pages"]
      
      unless pages.keys.include? "-1"
        return pages[pages.keys[0]]["revisions"][0]["*"]
      end
      
    end
    false
  end
  
  def get_etymology_text
   # ===Etymology(?:|\s\d+)===([\S\s]*?)===
  end
  
  def get_text_in_lang(text, lang)
   # content_regex = "==language==([\\S\\s]*?)(?:[^=]==[^=]|$)"
  end
  
end