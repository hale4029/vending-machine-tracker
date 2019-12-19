class CreateMachineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_items do |t|
      t.references :item, foreign_key: true
      t.references :machine, foreign_key: true
    end
  end
end
