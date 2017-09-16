class CreateReferrals < ActiveRecord::Migration[5.1]
  def change
    create_table :referrals do |t|
      t.string :name
      t.string :email
      t.string :refer_name
      t.string :refer_email
      t.timestamps
    end
  end
end
