class Location < ActiveRecord::Base
  searchkick autocomplete: ['name']

  belongs_to :user
  has_and_belongs_to_many :tags
  mount_uploader :image, LocationImageUploader

  validates :name,  :presence => true,
                    :length => { :minimum => 3, :maximum => 75 }
end
