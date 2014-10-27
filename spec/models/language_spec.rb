describe Language do
  let(:english) { Language.find_by(code: "en") }
  
  it "should have a full name" do
    expect(english.name).to eq("English")
  end
  
  it "should have etymologies" do
    expect(english.etymologies.first.headword).to eq("mouse")
  end
  
  it "should have words" do
    expect(english.words.first.content).to eq("mouse")
  end
  
end