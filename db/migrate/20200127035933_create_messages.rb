class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.text :text
      t.integer :conversation_id
    end
  end
end
