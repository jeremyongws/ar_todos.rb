class CreateTasks < ActiveRecord::Migration
    def change
        create_table :tasks do |t|
            t.string :taskname
            t.string :status, :default => "Not Completed"
            t.integer :list_id

            t.timestamps
        end
    end
end