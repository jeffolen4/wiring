json.array!(@products) do |product|
  json.extract! product, :id, :product_code, :upg_description, :compound, :nec_article, :shielded, :application, :strand_type, :pairs_count, :awg, :stand_count, :stranded, :solid, :putup, :length, :unit_weight_lbs, :unit_weight_kgs, :nom_od, :unit_copper_weight, :carton_quantity
  json.url product_url(product, format: :json)
end
