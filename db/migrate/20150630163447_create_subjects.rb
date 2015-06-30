class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.column :title, :string
      t.timestamps
    end
  end
end
