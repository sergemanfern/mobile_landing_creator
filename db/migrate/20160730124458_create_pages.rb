class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :name
      t.string :title
      t.text :offer
      t.text :footer_text

      t.timestamps
    end
  end
end
