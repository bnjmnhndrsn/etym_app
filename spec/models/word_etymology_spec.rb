require 'spec_helper'

describe WordEtymology do
  let (:word_etymology){ WordEtymology.find(1) }
  
  it "should have a word" do
    word_id = word_etymology.word_id
    expect(Word.find_by(content: "mouse").id).to eq(word_id)
  end
  
  it "should have an etymology" do
    etymology_id = word_etymology.etymology_id
    expect(Etymology.find_by(headword: "mouse").id).to eq(etymology_id)
  end
  
  it "should have a distance" do
    expect(word_etymology.distance).to eq(0)
  end
end