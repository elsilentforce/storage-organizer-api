class Container < ApplicationRecord
  has_many :contents
  has_many :items, through: :contents
end
