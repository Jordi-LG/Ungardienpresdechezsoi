module ApplicationHelper
  include PetsittersHelper
  include PetownersHelper
  include CommentsHelper


  #HIDE NAVBAR IN SELECTED PAGES
  def show_navbar
    !current_page?(controller: 'petowners/registrations', action: 'new') &&
    !current_page?(controller: 'petowners/sessions', action: 'new') &&
    !current_page?(controller: 'petowners/registrations', action: 'edit') &&
    !current_page?(controller: 'petowners/passwords', action: 'new') &&
    !current_page?(controller: 'petsitters/registrations', action: 'new') &&
    !current_page?(controller: 'petsitters/sessions', action: 'new') &&
    !current_page?(controller: 'petsitters/registrations', action: 'edit') &&
    !current_page?(controller: 'petsitters/passwords', action: 'new')


  end

  def show_footer
    !current_page?(controller: 'petowners/registrations', action: 'new') &&
    !current_page?(controller: 'petowners/sessions', action: 'new') &&
    !current_page?(controller: 'petowners/registrations', action: 'edit') &&
    !current_page?(controller: 'petowners/passwords', action: 'new') &&
    !current_page?(controller: 'petsitters/registrations', action: 'new') &&
    !current_page?(controller: 'petsitters/sessions', action: 'new')  &&
    !current_page?(controller: 'petsitters/registrations', action: 'edit') &&
    !current_page?(controller: 'petsitters/passwords', action: 'new')

  end
end
