class AddFollowingsTousers < ActiveRecord::Migration[5.2]
  def changecreate_table :users do |t|
      t.integer :followings

    end
  end
