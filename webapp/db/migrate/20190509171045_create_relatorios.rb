class CreateRelatorios < ActiveRecord::Migration[5.2]
  def change
    create_table :relatorios do |t|
      t.string :guid
      t.string :data
      t.string :url

    end
  end
end
