class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
    	t.references :user, foreign_key: true
    	t.string :category
    	t.string :position
    	t.string :field
    	t.string :start_time
    	t.date :date
    	t.integer :num_of_player



      t.timestamps
    end
  end
end
