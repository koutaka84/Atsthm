class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.text :animal_name
      t.string :image_id #画像を示すID
      t.text :caption #画像の説明
      t.integer :user_id #投稿したユーザを識別するID（Usersテーブルのidを保存する）

      t.timestamps
    end
  end
end
