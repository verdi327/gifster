class AddCreatedByToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :created_by, :integer
  end
end
