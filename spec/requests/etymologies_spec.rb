require 'spec_helper'

describe "Etymologies" do
  num = 30
  subject { page }
  
  before do
    num.times { FactoryGirl.create(:etymology) }
    visit etymologies_path
  end
  
  after { Etymology.delete_all }
  
  
  describe "index" do
    it { should have_title("Etymologies") }
    it { should have_selector("li", count: num) }
    
    
    it "should have links that go to pages" do
      Etymology.all.each do |etymology|
          click_link etymology.headword
          expect(page).to have_content(etymology.headword)
          visit etymologies_path
     end
    end
  end
  
  describe "etymology pages" do
    let!(:etymology) { Etymology.first }
    
    before do
      5.times { FactoryGirl.create(:a_word, etymology: etymology) }
      visit etymology_path(etymology)
    end
    
    describe "headers" do
      it { should have_title(etymology.headword) }
      it { should have_selector("h1", text: etymology.headword) }
      it { should have_selector("h2", text: etymology.lang) }
    end
    
    describe "overview" do

      let(:overview) { find("div#overview") }
      let(:entries) { find("div#overview").all("div.entry") }
      
      it "should have the correct amount of entries" do
        overview.should have_selector("div.entry", count: etymology.words.count)
      end
      
      it "should have entries with correct content" do
        etymology.words.to_a.reverse.each_with_index do |word, i|
            entries.at(i).should have_selector(".content", text: word.content )
            entries.at(i).should have_selector(".lang", text: get_lang_name(word.lang) )
        end
      end
      
    end
    
    describe "closeup" do
     
      
      let(:closeups) { find("div#closeups") }
      let(:entries) { find("div#closeups").all(".entry") }
      
      it "should have the correct amount of entries" do
        closeups.should have_selector("div.entry", count: etymology.words.count - 1)
      end
      
      
      it "should have entries with correct content" do
        words = etymology.words.to_a.reverse
        
        entries.each_with_index do |entry, i|
          arr = s_matcher(words[i].content, words[i+1].content)
          arr.each do |hash|
            entry.should have_selector("span", text: hash.values.first)
          end
        end
      end
      
    end
    
    describe "languages" do
     
      
      let(:languages) { find("div#languages") }
      let(:entries) { find("div#languages").all(".entry") }
      
      it "should have the correct amount of entries" do
        languages.should have_selector("div.entry", count: etymology.words.count)
      end
      
      
      it "should have entries with correct content" do
        words = etymology.words.to_a.reverse
        
        entries.each_with_index do |entry, i|
          entry.should have_content( get_lang_name(etymology.words[i].lang) )
        end
        
      end
    end
    
    
  end
  

end
