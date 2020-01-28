class AddCreatedAtToMessages < ActiveRecord::Migration[6.0]
  def change
    change_table :messages do |t|
      t.datetime :created_at
    end
  end
end
