class AddRazorpayPaymentIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :razorpay_payment_id, :string
  end
end
