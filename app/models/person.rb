class Person < ActiveRecord::Base

  has_many :group_functions
  has_many :groups, through: :group_functions
  has_one  :user
  #has_many :mail_aliases, polymorphic: true

end
