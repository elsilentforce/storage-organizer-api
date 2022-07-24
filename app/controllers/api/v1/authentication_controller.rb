module Api
  module V1
    class AuthenticationController < ApplicationController
      @user = User.find_by_email()
    end
  end
end