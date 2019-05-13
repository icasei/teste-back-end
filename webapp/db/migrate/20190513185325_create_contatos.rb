class CreateContatos < ActiveRecord::Migration[5.2]
  def change
    create_table :contatos,{:id => false}do |t|
      t.string :nome
      t.string :email, primary_key: true
    end
  end
end
