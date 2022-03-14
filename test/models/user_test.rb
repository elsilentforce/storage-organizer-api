require "test_helper"

class UserTest < ActiveSupport::TestCase
  describe "User test" do
    describe "with valid params" do
      let(:user) { User.new(first_name: "John", last_name: "Doe", email: "john1.doe@somemail.com") }
  
      it "saves the user" do
        expect user.valid?
      end
    end
  
    describe "with invalid params" do
      let(:user) { User.new(first_name: "John", last_name: "Doe", email: "john1.doe@somemail.com") }
  
      it "displays an error when User has no first name" do
        user.first_name = nil
        refute user.valid?, 'User saved without first name'
        refute user.errors[:first_name].empty?, 'No validation error for first name'
      end
  
      it "displays an error when User has no last name" do
        user.last_name = nil
        refute user.valid?, 'User saved without last name'
        refute user.errors[:last_name].empty?, 'No validation error for last name'
      end
  
      it "displays an error when User has no email" do
        user.email = nil
        refute user.valid?, 'User saved without email'
        refute user.errors[:email].empty?, 'No validation error for email'
      end
  
    end
    
  end
end
