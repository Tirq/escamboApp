class AdminPolicy < ApplicationPolicy

def new?
	user.full_access?	
end

def disable_roles?
  user.restricted_access? 
end

def destroy?
  user.id != record.id && user.full_access?
end 

  
def permitted_attributes
    if user.full_access?
      [:name, :email, :role, :password, :password_confirmation]
    else
      [:name, :email, :password, :password_confirmation]
    end
  end

  class Scope < Scope
    def resolve
    	if user.full_access?
      	scope.all
      else
      	scope.with_restricted_access
    	end
    end
  end
end
