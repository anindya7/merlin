class RenameRazorpayPidColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :razorpay_payment_id, :payment_id
  end
end
