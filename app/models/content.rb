class Content < ApplicationRecord
  belongs_to :container
  belongs_to :item
end
