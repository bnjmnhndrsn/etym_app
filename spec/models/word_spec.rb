require 'spec_helper'

describe Word do
  let(:etymology) { FactoryGirl.create(:etymology) }
  before do 
    @word1 = etymology.words.build(content: "foobar", lang: "en") 
    @word2 = etymology.words.build(content: "moobar", lang: "ml")
  end
  
  subject { @word1 }
  it { should respond_to(:content) }
  it { should respond_to(:lang) }
  it { should respond_to(:etymology) }
  it { should respond_to(:etymology_id) }
  its(:etymology) { should eq etymology }
  
  it { should be_valid }
  
  describe "when etymology_id is not present" do
    before { @word1.etymology_id = nil }
    it { should_not be_valid }
  end 
  
  describe "when content is not present" do
    before { @word1.content = nil }
    it { should_not be_valid}
  end
  
  describe "distance should be based on count" do
    its(:distance) { should eq(0) }
   # expect(@word2.distance).to eq(1) 
  end
  
end
