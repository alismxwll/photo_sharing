class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :user_email
      t.integer :post_id
    end
  end
end
