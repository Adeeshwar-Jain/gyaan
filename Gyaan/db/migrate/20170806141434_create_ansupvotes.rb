class CreateAnsupvotes < ActiveRecord::Migration
  def change
    create_table :ansupvotes do |t|
      t.references :user
      t.references :answer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
