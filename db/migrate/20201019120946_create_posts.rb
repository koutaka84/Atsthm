class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
	    t.references :user, foreign_key: true
	    t.text :body

	    t.timestamps
	    #t.index [:user_id], unique: true
    end
  end
end
