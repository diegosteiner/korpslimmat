class Group < ActiveRecord::Base

  belongs_to :parent, class_name: 'Group'
  has_many :people_functions, class_name: 'GroupFunction'
  has_many :people, through: :people_functions


  def to_s
    name
  end
end
