class CreateQuestionResponsible < ActiveRecord::Migration[7.0]
  def change
    create_table :question_responsibles do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :question_responsibles, [:question_id, :user_id], unique: true
  end
end
