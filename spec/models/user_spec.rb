require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "is a valid test" do
      user = User.new ({
        name: "Bob",
        last_name: "Hanks",
        email: "bob@example.com",
        password: "abcde",
        password_confirmation: "abcde"
        })
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = User.new(name: nil)
      user.valid?
      # puts user.errors.full_messages.inspect
      # (can use this to see what the errors actually are!!)
      expect(user.errors.full_messages).to include("Name can't be blank")
    end

    it "is invalid without a last_name" do
      user = User.new(last_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it "is invalid without an email" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "is invalid without an password" do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "is invalid without a password confirmation" do
      user = User.new(password_confirmation: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "password dont match" do
      user = User.new({
        name: "Bob",
        last_name: "Hanks",
        email: "bob@example.com",
        password: "abcde",
        password_confirmation: "abcdefg"
        })
      expect(user.valid?).to be false
    end

    it "password has minimum 5 characters" do
      user = User.new({
        name: "Bob",
        last_name: "Hanks",
        email: "bob@example.com",
        password: "abcd",
        password_confirmation: "abcd"
        })
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

    it "email must be unique" do
      User.create({
        name: "Bob",
        last_name: "Hanks",
        email: "bob@example.com",
        password: "abcde",
        password_confirmation: "abcde"
        })

       user = User.new({
        name: "Sally",
        last_name: "Johnson",
        email: "bob@example.com",
        password: "12345",
        password_confirmation: "12345"
        })

      expect(user.valid?).to be false
      expect(user.errors[:email]).to include("has already been taken")
    end

    it "email must be unique" do
      User.create({
        name: "Bob",
        last_name: "Hanks",
        email: "bOb@example.com",
        password: "abcde",
        password_confirmation: "abcde"
        })

       user = User.new({
        name: "Sally",
        last_name: "Johnson",
        email: "bob@example.COM",
        password: "12345",
        password_confirmation: "12345"
        })
      expect(user.valid?).to be false
      expect(user.errors[:email]).to include("has already been taken")
    end
  end


  describe '.authenticate_with_credentials' do
    it "authentication is true" do
      @user = User.create({
        name: "Bob",
        last_name: "Hanks",
        email: "bob@example.com",
        password: "abcde",
        password_confirmation: "abcde"
      })

      user_auth = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user_auth).to eql @user
    end

    it "login with wrong case" do
      @user = User.create({
        name: "Bob",
        last_name: "Hanks",
        email: "bOb@example.com",
        password: "abcde",
        password_confirmation: "abcde"
      })
      user_auth = User.authenticate_with_credentials("BOb@EXAMPLE.CoM", @user.password)
      expect(user_auth).to eql @user

    end

    it "login allowed with whitespace" do
      @user = User.create({
        name: "Bob",
        last_name: "Hanks",
        email: " bob@example.com ",
        password: "abcde",
        password_confirmation: "abcde"
      })

      user_auth = User.authenticate_with_credentials("  bob@example.com  ", @user.password)
      expect(user_auth).to eql @user
    end
  end
end
