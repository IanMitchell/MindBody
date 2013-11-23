class Tag < ActiveRecord::Base
  has_and_belongs_to_many :locations

  validates :name,  :presence => true,
                    :uniqueness => true,
                    :length => { :minimum => 1, :maximum => 75 }
end
