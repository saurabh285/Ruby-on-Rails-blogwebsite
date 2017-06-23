class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
        t.string :username
        t.string :email,            :null => false
        t.string :crypted_password
        t.string :salt

        t.timestamps
    end
  end
end
