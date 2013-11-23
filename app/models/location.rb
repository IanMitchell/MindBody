class Location < ActiveRecord::Base
  searchkick autocomplete: ['name']

  belongs_to :user
  has_and_belongs_to_many :tags
  mount_uploader :image, LocationImageUploader


  validates :name,  :presence => true,
                    :length => { :minimum => 3, :maximum => 75 }

  attr_reader :tag_tokens
  attr_accessible :name, :tag_tokens

  def tag_tokens=(tokens)
    self.tag_ids = Tag.ids_from_tokens(tokens)
  end
end
