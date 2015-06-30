class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.column :title, :string
      t.column :content, :string
      t.column :subject_id, :integer

      t.timestamps
    end
  end
end
