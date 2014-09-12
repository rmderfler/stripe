class Donation < ActiveRecord::Base
  after_create :add
  belongs_to :user
  attr_accessor :token

  private
    def add
      Stripe.api_key = "sk_test_LIeCBTv3nCs4I35yzMthkk5f"

      begin
        donation = Stripe::Charge.create(
          :amount => amount, # amount in cents, again
          :currency => "usd",
          :card => token,
          :description => User.find(self.user_id).email
        )
      rescue Stripe::CardError => e
        # The card has been declined
      end
    end
end
