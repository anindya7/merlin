class PaytmController < ApplicationController
  include PaytmHelper
  skip_before_action :verify_authenticity_token, only: ["verify_payment"]
  before_action :get_paytm_keys

	def start_payment
#     add application logic unique to your app
    paramList = Hash.new
    paramList["MID"] = @paytm_keys['MID']
    paramList["ORDER_ID"] = "#{Time.now.to_i.to_s}"
    paramList["CUST_ID"] = "#{Time.now.to_i.to_s}"
    paramList["INDUSTRY_TYPE_ID"] = @paytm_keys['INDUSTRY_TYPE_ID']
    paramList["CHANNEL_ID"] = @paytm_keys['CHANNEL_ID']
    paramList["TXN_AMOUNT"] = 399
    paramList["EMAIL"] = 'tejas.tholpadi7@gmail.com'
    paramList["WEBSITE"] = @paytm_keys['WEBSITE']
    paramList["CALLBACK_URL"] = @paytm_keys['CALLBACK_URL']
    @paramList=paramList
    @checksum_hash=generate_checksum()
    @user_details = Hash.new
    @user_details["email"] = 'tejas.tholpadi7@gmail.com'
    @user_details["password"] = 'pass1234'
    respond_to do |format|
      format.js
      format.html
    end
  end

  def verify_payment
    paytmparams = Hash.new
    keys = params.keys
    keys.each do |k|
      paytmparams[k] = params[k]
    end
    @checksum_hash = paytmparams["CHECKSUMHASH"]
    paytmparams.delete("CHECKSUMHASH")
    paytmparams.delete("controller")
    paytmparams.delete("action")
    @paytmparams = paytmparams
    @is_valid_checksum = verify_checksum()


    if @is_valid_checksum == true
      if @paytmparams["STATUS"] == "TXN_SUCCESS"
        #     add application logic unique to your app
        # @args = Hash.new
        @paramList = Hash.new
        @paramList["MID"] = params['MID']
        @paramList["ORDER_ID"] = params['ORDERID']
        @ch = generate_next_checksum(@paramList, @paytm_keys['PAYTM_MERCHANT_KEY']).gsub("\n",'')
        @args = { MID: @paramList['MID'], ORDERID: @paramList['ORDER_ID'], CHECKSUMHASH: u(@ch) }
        @args = @args
        respond_to do |format|
          format.html
        end
      else
        respond_to do |format|
          format.html
        end
      end
    end
  end

  private

  def get_paytm_keys
    # @paytm_keys=Rails.application.config.paytm_keys
    @paytm_keys = Hash.new
    @paytm_keys['PAYTM_MERCHANT_KEY'] = ENV['PAYTM_MERCHANT_KEY']
    @paytm_keys['WEBSITE'] = ENV['WEBSITE']
    @paytm_keys['MID'] = ENV['MID']
    @paytm_keys['INDUSTRY_TYPE_ID'] = ENV['INDUSTRY_TYPE_ID']
    @paytm_keys['CHANNEL_ID'] = ENV['CHANNEL_ID']
    @paytm_keys['payment_url'] = ENV['payment_url']
    @paytm_keys['CALLBACK_URL'] = ENV['CALLBACK_URL']
  end

end