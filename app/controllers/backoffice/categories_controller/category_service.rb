class Backoffice::CategoriesController::CategoryService
	attr_accessor :category

	def self.create(params)
		@category = Category.new(params)
		
		if @category.valid?
			@category.save!
		end
		
		@category
	end

end