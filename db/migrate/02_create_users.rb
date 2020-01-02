class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.time :bed_time
      t.time :wake_up_time

      t.timestamps
    end
  end
end
