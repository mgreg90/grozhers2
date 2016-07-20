class CreateGroupItemAndGroupUserJoinTables < ActiveRecord::Migration[5.0]
  def self.up
    create_table :groups_items, id: false do |t|
      t.integer :group_id
      t.integer :item_id
    end
    create_table :groups_users, id: false do |t|
      t.integer :group_id
      t.integer :user_id
    end

    add_index(:groups_items, [:group_id, :item_id], :unique => true)
    add_index(:groups_items, [:item_id, :group_id], :unique => true)
    add_index(:groups_users, [:group_id, :user_id], :unique => true)
    add_index(:groups_users, [:user_id, :group_id], :unique => true)
  end

  def self.down
    remove_index(:groups_items, [:group_id, :item_id])
    remove_index(:groups_items, [:item_id, :group_id])
    remove_index(:groups_users, [:group_id, :user_id])
    remove_index(:groups_users, [:user_id, :group_id])
    drop_table :groups_items
    drop_table :groups_users
  end
end
