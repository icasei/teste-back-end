class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    flash.now[:info] = 'Não há nenhum registro no momento' if @contacts.blank?
  end
end
