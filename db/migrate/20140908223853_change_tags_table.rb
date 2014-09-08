class ChangeTagsTable < ActiveRecord::Migration
  def change
    rename_column :tags, :user_email, :user_id
  end
end
