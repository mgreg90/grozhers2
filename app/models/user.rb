class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :groups

  def has_group?
    return true if self.groups.length > 0
    false
  end

end
