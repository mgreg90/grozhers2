class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :items

  def drop_item(item_id)
    self.items.delete(item_id)
  end
end
