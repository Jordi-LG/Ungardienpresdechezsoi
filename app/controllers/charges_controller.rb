class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount_in_cents = params[:amount]

    @amount_in_cents = @amount.gsub('$', '').gsub(',', '')

      begin
    @amount_in_cents = Float(@amount).round(2)
  rescue
    flash[:error] = "Montant non valide, merci d'entrée une valeur en dollar ($)."
    redirect_to new_charge_path
    return
  end

  @amount_in_cents = (@amount_in_cents * 100).to_i # Must be an integer!

  if @amount_in_cents < 100
    flash[:error] = 'Montant non valide, la donation doit etre superieur à 1$.'
    redirect_to new_charge_path
    return
  end

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount_in_cents,
      description: 'Donation',
      currency: 'EUR',
    })
    
    flash[:success] = 'Votre donation a bien été effectué, merci pour eux.'
    redirect_to controller: "associations", action: "index"

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

end
