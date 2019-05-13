class Contato < ActiveRecord::Base
    validates :nome, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP },uniqueness: { case_sensitive: false }
end