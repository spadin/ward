require 'helper'
require 'ward/ward_data'

class TestWardData < Test::Unit::TestCase
  context Ward::Data do
    setup do
      @ward_data = Ward::Data.new(response_fixture)
    end
    
    context 'Ward::Data#number' do      
      should 'return a Fixnum for the ward number' do
        assert_equal @ward_data.number.class, Fixnum
      end
    end
    context 'Ward::Data#alderman' do      
      should 'return a Hash for the alderman' do
        assert_equal @ward_data.alderman.class, Hash
      end
    end
  end
  def response_fixture
    filepath = File.join(File.dirname(__FILE__), 'fixtures','response.json')
    file     = File.open(filepath)
    json     = file.readlines[0].to_s
    response = JSON.parse(json).to_hash
  end
end
