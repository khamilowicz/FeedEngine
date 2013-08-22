class AddReceiverToMessages < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      t.references :receiver, polymorphic: true
    end
  end
end
