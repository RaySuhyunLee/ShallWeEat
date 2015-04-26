class Account < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 5, maximum: 20}, uniqueness: true
	validates :pass, presence: true, length: { minimum: 5, maximum: 20}

end
