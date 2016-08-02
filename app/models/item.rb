class Item < ApplicationRecord
  has_and_belongs_to_many :groups

  def self.search(term)
    where('LOWER(title) LIKE :term OR LOWER(author) LIKE :term', term: "%#{term.downcase}%")
  end
end
