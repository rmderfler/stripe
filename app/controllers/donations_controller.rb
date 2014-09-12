class DonationsController < ApplicationController


  def new
    @user = current_user
    @donation = Donation.new
  end

  def create
    # Create the charge on Stripe's servers - this will charge the user's card
    @donation = Donation.new(donation_params)
    @donation.user_id = current_user.id

    @donation.token = params[:stripeToken]

    if @donation.save
      redirect_to user_path(current_user), notice: "Payment added!"
    else
      render 'new'
    end
  end

private
  def donation_params
    params.require(:donation).permit(:amount, :stripeToken, :currency)
  end
end
