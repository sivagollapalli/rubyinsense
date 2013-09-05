require 'specs_helper'

describe QuestionsController do
  context "if user is not logged in, he cant" do
    it "create a question"
    it "update a question"
    it "see my questions page"
    it "destroy a question"
    it "vote up/down for an answer"
  end

  context "if user is not logged in, he can" do
    it "see questions index page"
    it "see a question show page"
  end

  context "if user is logged in, he can" do
    it "see questions index page"
    it "create a question"
    it "update a question"
    it "see a question show page"
    it "see my questions page"
    it "destroy a question"
    it "vote up/down for an answer"
  end
end
