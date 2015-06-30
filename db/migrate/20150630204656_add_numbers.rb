class AddNumbers < ActiveRecord::Migration
  def change
    add_column :subjects, :number, :integer
    add_column :lessons, :number, :integer
  end
end
