require 'spec_helper'

describe Word do
  let(:word) { Word.find_by(content: "mouse") }

  it "should have a language" do
    expect(word.language.name).to eq("English")
  end
  
   it "should have word etymologies" do
     expect(word.word_etymologies.first.word_id).to eq(word.id)
   end
  
end
