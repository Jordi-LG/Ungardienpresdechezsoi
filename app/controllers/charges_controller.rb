class ChargesController < ApplicationController

  def new

  end

  def create
    # Amount in cents
    @association = params[:association]
    @petowner = params[:id_petowner]
    @petsitter = params[:id_petsitter]


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

  if @amount < 100 || @amount > 9999999
    flash[:warning] = 'Montant non valide, la donation doit etre superieur à 1$ et inferieur a 1M$.'
    redirect_to controller: "organizations", action: "index"
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

    if current_petowner
      donation = Donation.create(amount: @amount, id_user: @petowner, is_po: true, is_ps: false, stripe_customer_id: params[:stripeToken], organization_id: @association )
    else current_petsitter
      donation = Donation.create(amount: @amount, id_user: @petsitter, is_po: false, is_ps: true, stripe_customer_id: params[:stripeToken], organization_id: @association )
    end

    flash[:success] = 'Votre donation a bien été effectué, merci pour eux.'
    redirect_to organization_path(@association)


    rescue Stripe::CardError => e
      flash[:warning] = e.message
      redirect_to controller: "organizations", action: "index"
  end

end
