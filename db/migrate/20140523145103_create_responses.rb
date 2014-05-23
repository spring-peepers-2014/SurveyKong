class CreateResponses < ActiveRecord::Migration
  def change
    create_table :repsonses do |t|
      t.belongs_to :question
      t.belongs_to :option
    end
  end
end
