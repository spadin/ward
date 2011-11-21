require 'httparty'
require 'geocoder'

$LOAD_PATH.unshift File.dirname(__FILE__)
require 'ward/ward_data'

class Ward
  include HTTParty
  base_uri 'api.boundaries.tribapps.com'
  
  def initialize(username = nil, api_key = nil)
    @username = username
    @api_key  = api_key
  end
  
  # Find the ward for a given address.
  def find(address)
    # Geocode the given address.
    geocode address

    ward = Data.new(data)
    ward.to_hash
  end
  
  private
  def options
    @options = {
      :query => {
        :contains => "#{@lat},#{@lon}",
        :sets     => 'wards'
      }
    }
    unless @username.nil? and @api_key.nil?
      @options[:query][:username] = @username
      @options[:query][:api_key]  = @api_key
    end
    
    @options
  end
  
  def geocode(address)
    @lat,@lon = Geocoder.coordinates(address)
  end
  
  def data
    self.class.get("/1.0/boundary", options)
  end
end