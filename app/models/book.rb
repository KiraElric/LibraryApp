class Book < ApplicationRecord
  belongs_to :publisher
  has_and_belongs_to_many :authors

  enum genre: %i[ drama novel fiction fantasy terror mistery science biography ]
  enum language: %i[ english spanish japanese germany portuguese french italian ]
end
