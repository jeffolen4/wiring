desc "Import Products"
task :import_products => :environment do
  require 'csv'



  CSV.foreach("./lib/tasks/wiring_export_1.csv") do |row|

    if row[0] != nil

      p = Product.new
      p.product_code = row[0]
      p.upg_description = row[1]
      p.compound = row[2]
      p.nec_article = row[3]

      if row[4].to_s.upcase == "NS"
        p.shielded = false
      else
        p.shielded = true
      end

      p.application = row[5]
      p.strand_type = row[6]
      p.pairs_count = row[7]
      p.awg = row[8]
      p.stand_count = row[9]

      if row[10].to_s.upcase == "SOL"
        p.solid = true
      else
        p.solid = false
      end

      if row[10].to_s.upcase == "STR"
        p.stranded = true
      else
        p.stranded = false
      end

      p.putup = row[11]
      p.length = row[12]
      p.unit_weight_lbs = row[13]
      p.unit_weight_kgs = row[14]
      p.nom_od = row[15]
      p.unit_copper_weight = row[16]
      p.carton_quantity = row[17]

      p.save

    end


  end
end
