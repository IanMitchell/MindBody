class Location < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  mount_uploader :image, LocationImageUploader

  validates :name,  :presence => true,
                    :length => { :minimum => 3, :maximum => 75 }

  validates :url,   :format => { :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix },
                    :allow_blank => true
end
