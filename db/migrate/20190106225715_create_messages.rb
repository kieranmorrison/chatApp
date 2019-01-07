class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.belongs_to :chat, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
