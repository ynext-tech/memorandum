class Shop < ApplicationRecord
  validates_associated :images
  validates :images, presence: true
  validates :shop_name, presence: true
  validates :text, presence: true
  validates :address, presence: true
  validates :phone, presence: true

  # after_validation :geocode

  # private
  # def geocode
  #   uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=[AIzaSyDA_oTvNoFIB9f3nEA8liek0AF62zcxz24]")
  #   res = HTTP.get(uri).to_s
  #   response = JSON.parse(res)
  #   self.latitude = response["results"][0]["geometry"]["location"]["lat"]
  #   self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  # end

  # geocoded_by :address
  # after_validation :geocode, if: lambda {|obj| obj.address_changed?}  

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user, optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments
end