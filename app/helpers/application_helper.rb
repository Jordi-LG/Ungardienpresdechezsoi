module ApplicationHelper
  include PetsittersHelper
  include PetownersHelper


  #HIDE NAVBAR IN SELECTED PAGES
  def show_navbar
    !current_page?(controller: 'petowners/registrations', action: 'new') &&
    !current_page?(controller: 'devise/sessions', action: 'new')
  end

  def show_footer
    !current_page?(controller: 'petowners/registrations', action: 'new')
  end
end
