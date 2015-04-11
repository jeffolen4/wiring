class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_code
      t.string :upg_description
      t.string :compound
      t.string :nec_article
      t.boolean :shielded
      t.string :application
      t.string :strand_type
      t.integer :pairs_count
      t.integer :awg
      t.string :stand_count
      t.boolean :stranded
      t.boolean :solid
      t.string :putup
      t.integer :length
      t.integer :unit_weight_lbs
      t.integer :unit_weight_kgs
      t.string :nom_od
      t.float :unit_copper_weight
      t.integer :carton_quantity

      t.timestamps null: false
    end
  end
end
