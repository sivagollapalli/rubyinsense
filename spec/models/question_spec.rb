require 'spec_helper'

describe Question do

  #--------relationship specs------------#
  it {should belong_to(:user)}
  it {should have_many(:answers)}
  it {should have_many(:comments)}


  #-------validation specs---------------#
  it {should validate_presence_of(:statement)}

  #-------method specs-------------------#
  context "should return" do

    before(:each) do
      #@user_1 = FactoryGirl.create(:user_1)
      @user_2 = FactoryGirl.create(:user_2)
    end

    it "true if logged in user is the owner of question" do
      question = FactoryGirl.create(:question_1)
      sign_in @user_1
      expect(question.question_posted?(@user_1)).to eq(true)
    end

    it "false if logged in user is the owner of question" do
      question = FactoryGirl.create(:question_1)
      sign_in @user_2
      expect(question.question_posted?(@user_2)).to eq(false)
    end
  end
end
