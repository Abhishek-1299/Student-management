class CreateWelcomes < ActiveRecord::Migration[7.0]
  def change
    create_table :welcomes do |t|
      t.string :index

      t.timestamps
    end
  end
end
