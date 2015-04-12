class Product < ActiveRecord::Base
  paginates_per 20

  default_scope { all }

  scope :single_application, lambda { |app| where("? = '' or upper(application) = ?", app.upcase, app.upcase ) }
  scope :single_gauge, lambda { |gauge| where("? = 0 or awg = ?", gauge.to_i, gauge.to_i ) }

  def self.search(search, page)
    if search == nil
      all.page page
    else
      search_condition = "%" + search + "%"
      where('upper(upg_description) LIKE ? OR upper(application) LIKE ?', search_condition.upcase, search_condition.upcase).page page
    end
  end

  def self.applications
    select('application').group('application').order('application')
  end

    def self.gauges
      select('awg').group('awg').order('awg')
    end
end
