## Ward

### About

Gets ward information for any given address in the city of Chicago.

### Usage

    ward = Ward.new
    ward.find('1 N. State St., Chicago, Il 60602')
    
### Response

    {:number=>42,
     :alderman=>
      {:name=>"Brendan Reilly",
       :office=>{:address=>"325 W HURON ST #510", :phone=>"312-642-4242"},
       :city_hall=>
        {:address=>"121 N LASALLE ST RM 306 60602", :phone=>"312-744-3062"}}}
    
### Thanks to...

* [Chicago Boundary Service](http://boundaries.tribapps.com)
* [HTTParty](https://github.com/jnunemaker/httparty)
* [Ruby Geocoder](http://www.rubygeocoder.com/)

