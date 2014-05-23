class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.belongs_to :question
      t.string :o_text

      t.timestamps
    end
  end
end
