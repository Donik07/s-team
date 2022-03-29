class AddMissingNullChecks < ActiveRecord::Migration[7.0]
  def change
    change_column :questions, :title, false
    change_column :questions, :body, false
    change_column :answers, :body, false
  end
end
