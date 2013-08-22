class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender, polymorphic: true
      t.text :content
      t.string :subject
    end
  end
end
