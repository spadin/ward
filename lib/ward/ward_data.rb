class Ward
  class Data
    attr_reader :data
    
    def initialize(data)
      begin
        data = data['objects'][0]['metadata']
        @data = {
          :number => Integer(data['WARD']),
          :alderman => {
            :name => data['ALDERMAN'].proper_name,
            :office => {
              :address => data['ADDRESS'],
              :phone   => data['WARD_PHONE']
            },
            :city_hall => {
              :address => data['HALL_OFFIC'],
              :phone   => data['HALL_PHONE']
            }
          }
        }
      rescue Exception => e
        @data = nil
      end
    end
    
    # Ward number
    def number
      @data[:number]
    end
    
    # Alderman Hash
    def alderman
      @data[:alderman]
    end
    
    # Hash of this Ward::Data
    def to_hash
      @data
    end
  end
end

class String
  
  # Capitalizes the first letter of each word.
  def proper_name
    self.split(' ').map {|w| w.capitalize }.join(' ')
  end
end