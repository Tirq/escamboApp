class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member


  validates :title, :description, :category, :image, :price, :finish_date, presence: true
  validates :price, numericality: {greater_than_or_equals_to: 0}

  has_attached_file :image, styles: {large:"900x400#", medium: "255x145#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  monetize :price_cents

  scope :lasts, -> (quantity=6) { limit(quantity).order(created_at: :desc) }

  scope :to_the, -> (member) { where(member: member ).order(created_at: :desc) }

end
