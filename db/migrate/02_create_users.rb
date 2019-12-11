class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.time :sleep
      t.time :sleep_duration
      t.time :wake

      t.timestamps
    end
  end
end
