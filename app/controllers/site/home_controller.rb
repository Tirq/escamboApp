class Site::HomeController < Site::SiteController
	layout 'site'

  def index
  	populate_categories
  	populate_ads
  end

  def populate_categories
  	@categories = Category.order_by_description
  end

  def populate_ads
  	@ads = Ad.lasts(6)
  end
  
end
