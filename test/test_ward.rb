require 'helper'

class TestWard < Test::Unit::TestCase
  context Ward do
    context 'Ward#find' do
      setup do
        @ward = Ward.new
        @ward.expects(:geocode).returns([41.9157125,-87.6560353])
        @ward.expects(:data).returns(response_fixture)
                
        @address = '1901 N. Clybourn Ave., Chicago, Il 60614'
      end
      should 'return a Fixnum for the ward number' do
        ward = @ward.find(@address)
        assert_equal ward[:number].class, Fixnum
      end
      should 'return an Hash for the alderman' do
        ward = @ward.find(@address)
        assert_equal ward[:alderman].class, Hash
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
