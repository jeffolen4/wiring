class Product < ActiveRecord::Base
  paginates_per 20

  default_scope { order(:product_code) }

  def self.search(search, page)
    if search == nil
      all.page page
    else
      search_condition = "%" + search + "%"
      where('upper(upg_description) LIKE ? OR upper(application) LIKE ?', search_condition.upcase, search_condition.upcase).page page
    end
  end

end
