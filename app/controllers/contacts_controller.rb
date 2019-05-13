# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :set_contact, only: :show

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: 422 }
      end
    end
  end

  def show; end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:email, :name)
  end
end
