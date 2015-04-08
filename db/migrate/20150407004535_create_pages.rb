class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.decimal :long
      t.decimal :lat

      t.timestamps
    end
  end
end
