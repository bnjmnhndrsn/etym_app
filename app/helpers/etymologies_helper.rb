module EtymologiesHelper
  
  # include ParsingMethods
  
  def get_lang_name(abrev)
    abrev
  end
  
  def substrings(str)
  
    arr = []
    (0...str.length).to_a.each do |i|
      (i...str.length).to_a.each do |j|
        arr << {string: str[i..j], index: i}
      end
    end
    arr
  end
  
  def s_matcher(s1, s2)
    dif = 1 #max absolute difference of indexes for substring matching
    ret = []
    subs1 = substrings(s1)
    subs2 = substrings(s2)
    
    #find all substrings which match and are less than dif
    matching = []
    
    subs1.each do |elem1|
      subs2.each do |elem2| 
        if elem1[:string] == elem2[:string] && (elem1[:index] - elem2[:index]).abs <= dif
          matching << [elem1, elem2]
        end
      end
    end
    
    #if no matching substrings, return entire input strings
    if matching.length == 0
      ret += [{ old_word: s1}, { new_word: s2 }]
    else
      
      matching.sort! { |x, y| y[0][:string].length <=> x[0][:string].length } 
      longest = matching.first
      
      ret += [{both_word: longest[0][:string]}]
      
      #if longest substring is not at front of input strings, recursive call on remaining portion
      if longest[0][:index] > 0 || longest[1][:index] > 0
        ret = s_matcher(s1[0...longest[0][:index]], s2[0...longest[1][:index]]) + ret
      end
      
      #if longest substring is not at end of input strings, recursive call on remaining portion
      s1End = longest[0][:string].length + longest[0][:index]
      s2End = longest[1][:string].length + longest[1][:index]
      
      if s1End < s1.length || s2End < s2.length
        ret += s_matcher(s1[s1End...s1.length], s2[s2End...s2.length])
      end
         
    end
    ret
  end

end