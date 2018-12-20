class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|
      t.integer :counter
      t.string :img_url
    end
  end
end
