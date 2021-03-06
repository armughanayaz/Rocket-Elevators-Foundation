class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      
      t.integer :author
      t.integer :customerId, null: false
      t.integer :buildingId, null: false
      t.integer :batterieId, null: false
      t.integer :columnId
      t.integer :elevatorId
      t.integer :employeeId
      t.date :start_date
      t.date :end_date
      t.string :result
      t.string :report
      t.string :status

      t.timestamps
    end
  end
end
