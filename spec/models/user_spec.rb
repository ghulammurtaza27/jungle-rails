require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should save a user when name, email, and password are provided properly' do
      user = User.create(
        first_name: "Ghulam",
        last_name: "Murtaza",
        email: "gm@gm.com",
        password: "gmc",
        password_confirmation: "gmc"
      )
      expect(user).to be_valid
    end

    it 'must ensure that password and password_confirmation fields match' do
      user = User.create(
        first_name: "Ghulam",
        last_name: "Murtaza",
        email: "gm@gm.com",
        password: "gmc",
        password_confirmation: "oopsie"
      )
      expect(user).to_not be_valid
    end

    it 'should requore both password and password confirmation fields to be filled' do
      user = User.create(
        first_name: "Ghulam",
        last_name: "Murtaza",
        email: "gm@gm.com",
        password: nil,
        password_confirmation: "gmc"
      )
      expect(user).to_not be_valid
    end

    it 'must ensure that emails are unique (not case-sensitive)' do
      user1 = User.create(
        first_name: "Ghulam",
        last_name: "Murtaza",
        email: "gm@gm.com",
        password: "gmco",
        password_confirmation: "gmco"
      )
      user2 = User.create(
        first_name: "Ghulam",
        last_name: "Murtaza",
        email: "gm@gm.com",
        password: "gmco",
        password_confirmation: "gmco"
      )
      expect(user2).to_not be_valid
    end

    it 'must require name and email' do
      user = User.new(
        first_name: nil,
        last_name: nil,
        email: nil,
        password: "oops",
        password_confirmation: "oops"
      )
      expect(user).to_not be_valid
    end

    it 'must have a minimum length on password' do
      user = User.new(
        first_name: "Ghulam",
        last_name: "Murtaza",
        email: "gm@gm.com",
        password: "g",
        password_confirmation: "g"
      )
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should authenticate if credentials exist in database" do
      user = User.create(
        first_name: "Ghulam",
        last_name: "Murtaza",
        email: "gm@gm.com",
        password: "gmc",
        password_confirmation: "gmc"
        )
      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to_not be_valid
    end
  end
end
