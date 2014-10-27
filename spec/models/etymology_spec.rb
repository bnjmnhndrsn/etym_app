require 'spec_helper'

describe Etymology do
  let(:etymology){ Etymology.find(1) }
  
  it "should have a headword" do
    expect(etymology.headword).to eq("mouse")
  end
  
  it "should have a language" do
    expect(etymology.language.name).to eq("English")
  end
  
  describe "#words" do
    let(:words){ etymology.words }
     
    it "should all be word objects" do
      expect(words.all? {|word| word.is_a?(Word) }).to eq(true)
    end
    
    it "should return a collection of the correct length" do
      expect(words.length).to eq(5)
    end
    
    specify "they should have a distance field" do
      expect(words.all? {|word| word.respond_to?(:distance) }).to eq(true)
    end
    
    specify "they should be sorted in descending order via distance" do
      expect(words.map(&:distance)).to eq([4, 3, 2, 1, 0])
    end
  end
  
  
end