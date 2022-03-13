require "test_helper"

class UserTest < ActiveSupport::TestCase

  describe "with valid params" do
    let(:user) { User.new(first_name: "John", last_name: "Doe", email: "john1.doe@somemail.com") }

    it "saves the user" do
      expect user.valid?
    end
  end
end
