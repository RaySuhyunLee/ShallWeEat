class Account < ActiveRecord::Base
	
  validates :name, presence: true,
                       length: { minimum: 5, maximum: 20 },
                       uniqueness: { case_sensitive: true }
  validates :pass, presence: true,
                       length: { minimum: 8, maximum: 20 }

end
