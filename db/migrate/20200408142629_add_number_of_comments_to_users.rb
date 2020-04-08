class AddNumberOfCommentsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :number_of_comments, :integer, default: 0
  end
end
