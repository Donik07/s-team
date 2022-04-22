class CreateAvatars < ActiveRecord::Migration[7.0]
  def change
    create_table :avatars do |t|
      t.text :photo
      t.belongs_to :user, foreign_key: true
    end
  end
end
