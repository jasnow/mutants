class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :groups, [:name], unique: true, name: 'groups_name_uidx'
  end
end