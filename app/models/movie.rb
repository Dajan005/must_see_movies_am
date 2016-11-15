class Movie < ApplicationRecord
  # Direct associations

  has_many   :characters,
             :dependent => :destroy

  belongs_to :director

  # Indirect associations

  has_many   :actors,
             :through => :characters,
             :source => :actor

  # Validations

  validates :director_id, :presence => true

  validates :title, :uniqueness => { :scope => [:year] }

  validates :title, :presence => true

  validates :year, :numericality => { :less_than_or_equal_to => 2015, :greater_than_or_equal_to => 1870 }

end
