class User < ActiveRecord::Base

	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	# first name must be present, over 1 char, under 50 chars
	validates :first_name, presence: true, length: {in: 2..50}

	# last name must be present, over 1 char, under 50 chars
	validates :last_name, presence: true, length: {in: 1..50}

	# email must be present, unique, over 1 char, under 50 chars, abides by REGEX
	validates :email, presence: true, length: {in: 1..50}, confirmation: true

	# user must fill out email confirmation
	validates :email_confirmation, presence: true

	validates_format_of :email, :with => EMAIL_REGEX

	# username must be present, unique, between 7..25 chars
	validates :username, presence: true, length: {in: 7..25}

	# password must be present, unique, between 7..20 chars
	validates :password, presence: true, length: {in: 7..15}, confirmation: true

	# user must fill out password confirmation
	validates :password_confirmation, presence: true

	# be careful of uniqueness: true, as it throws a "LIMIT 1" error

end
