module Backoffice::AdminsHelper

	Options = Struct.new(:id, :name)

	 

	def roles_old
		options = []
		# parte abaixo é o mesmo que um for
		# e o roles é o mesmo também mas mais otimizado
		Admin.roles_i18n.each do |id, name|
			options.push(Options.new(id,name))
		end 
		options
	end 

	def roles
		Admin.roles_i18n.map do |id, name|
			Options.new(id,name)	
		end	
	end 	

end
