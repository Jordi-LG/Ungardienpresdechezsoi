class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = params[:amount]
    @amount= @amount.gsub('$', '').gsub(',', '')

      begin
    @amount = Float(@amount).round(2)
  rescue
    flash[:warning] = "Montant non valide, merci d'entrée une valeur en dollar ($)."
    redirect_to controller: "associations", action: "index"
    return
  end

  @amount = (@amount * 100).to_i # Must be an integer!

  if @amount < 100
    flash[:warning] = 'Montant non valide, la donation doit etre superieur à 1$.'
    redirect_to controller: "associations", action: "index"
    return
  end

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Donation',
      currency: 'EUR',
    })
    
    flash[:success] = 'Votre donation a bien été effectué, merci pour eux.'
    redirect_to controller: "associations", action: "index"

    rescue Stripe::CardError => e
      flash[:warning] = e.message
      redirect_to controller: "associations", action: "index"
  end

end
