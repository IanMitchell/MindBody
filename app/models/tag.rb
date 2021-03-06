class Tag < ActiveRecord::Base
  searchkick autocomplete: ['name']

  has_and_belongs_to_many :locations

  validates :name,  :presence => true,
                    :uniqueness => true,
                    :length => { :minimum => 1, :maximum => 75 }

  attr_accessible :name

  def self.tokens(query)
    tags = where("name like ?", "%#{query}%")
    if tags.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      tags
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end
end
