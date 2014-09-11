class Donation < ActiveRecord::Base
  after_create :add
  belongs_to :user
  attr_accessor :stripeToken

  private
    def add
      Stripe.api_key = "sk_test_LIeCBTv3nCs4I35yzMthkk5f"

      # Get the credit card details submitted by the form
      #token = params[:stripeToken]

      begin
        donation = Stripe::Charge.create(
          :amount => amount, # amount in cents, again
          :currency => "usd",
          :card => stripeToken,
          #:description => params["stripeEmail"]
        )
      rescue Stripe::CardError => e
        # The card has been declined
      end
    end
end
