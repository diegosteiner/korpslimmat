class Event::Signup < ActiveRecord::Base
  require 'yaml'
  belongs_to :event

  def signup_options=o
    self.options_serialized = YAML::dump(o)
  end

  def signup_options
    YAML::load(options_serialized) rescue nil
  end

  validates :name, presence: true

end
