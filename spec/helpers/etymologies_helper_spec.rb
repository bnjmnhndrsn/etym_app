require 'spec_helper'

describe EtymologiesHelper do
  describe "substrings" do
    
    string = "asdf"
    result = substrings(string)
    
    it "should return an array of objects with both string and index" do
      expect(result.all? {|elem| elem.has_key?(:string) && elem.has_key?(:index)}).to be_true
    end
    
    it "should print all permutations" do
      just_strings = result.map {|elem| elem[:string]}
      answer = ["a", "as", "asd", "asdf", "s", "sd", "sdf", "d", "df", "f"] 
      (just_strings - answer).should be_empty
    end
    
    it "should have indexes which match" do
      expect(result.all? {|elem| string[elem[:index]] == elem[:string][0] }).to be_true
    end
  end
  
  describe "matcher" do
    s1 = "asdf"
    s2 = "sdfo"
    result = s_matcher(s1, s2)
    
    it "should return an array of hashes with single keys" do
      result.all?{|elem| elem.is_a?(Hash) }.should be_true
      result.all?{|elem| elem.keys.length == 1}.should be_true
    end
    
    it "should match single characters" do
      s_matcher("a","a").should eq([{both_word: "a"}])
      s_matcher("a","b").should eq([{old_word: "a"}, {new_word: "b"}])
    end
    
    it "should match a character to an empty string" do
      s_matcher("a","").should eq([{old_word: "a"}, {new_word:""}])
    end
    
    it "should match more complicated strings" do
      result.should eq([{old_word: "a"}, {new_word: ""}, {both_word: "sdf"}, {old_word: ""}, {new_word: "o"}])
    end
  end
  
  describe "parsing methods" do
    describe "load_wiki_page" do
      it "correct queries should return a string" do
        load_wiki_page("cook").is_a?(String).should be_true
        load_wiki_page("blue").is_a?(String).should be_true
      end
      
      it "incorrect/not found queries should return with false" do
        load_wiki_page("asdwirnigaena1").should be_false
        load_wiki_page(" ").should be_false
        load_wiki_page("").should be_false
      end
      
    end
  end
end