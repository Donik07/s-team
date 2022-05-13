class AddStatusInQuestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :statuses, null: false, foreign_key: true, default: 1
  end
end
