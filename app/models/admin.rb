class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:restricted_access, :full_access]        

  validates_presence_of :name


# exemplo usando scope / lambda(arrow) e abaixo mesmo exemplo se usado como método
 scope :with_full_access, -> { where(role: roles[:full_access]) }

 scope :with_restricted_access, -> { where(role: roles[:restricted_access]) }

  def self.with_full_access
    where(role: Admin.roles[:full_access])
  end


end