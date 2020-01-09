# Calorie Tracker - Ruby Hack Night

This project was started during the Chicago Ruby hack night on Wed, Jan 8th, 2020. A description of the project is located at "https://github.com/chicagoruby/hack-night-calorie-tracker" and also below.

Ruby version: '2.6.6'  
Rails version: '6.0.2'

## To run locally:

1. Clone from https://github.com/adbasner/BingoRubyHackNight.git
2. Run 'bundle install'
3. Create a database 'rails db:create'
4. Start server 'rails s'
5. View in your favorite browser at 'localhost:3000'

## Web version

To see a deployed version on heroku, visit:
https://calorie-finder-rubyhacknight.herokuapp.com/

## Description

This app could be made with any framework or language, I chose to use Ruby on Rails, mostly due to familiarity.

Search for a food with the search box in the menu. Basic nutrion info for the item will show up. The data is retrieved from the Nutritionix API. 

--------------------------------------------------------------------- 

From - https://github.com/chicagoruby/hack-night-calorie-tracker

# Calorie Tracker

Happy New Year! This time of year, many folks are resolving to make big changes in their lives. One common resolution people make is to eat healthier, and tonight's challenge is to build a tool to help people in this goal.

## Requirements

We will be using the [Nutritionix API](https://developer.nutritionix.com/) for nutrition data.

To get started, set up a [Nutritionix developer account](https://developer.nutritionix.com/signup) and note your app ID and api key.

## The application

Your application should allow users to search for foods and retrieve nutritional information for the search. For example, if a user wants to see how far back a "Big Mac" would set them on their diet, their search would yield and display any relevant information about a Big Mac's nutrition.

The search function is the only required feature. Explore the API documentation and figure out what you can add to improve your application. What additional data can you get from the application? How can you customize a user's experience? There are some neat natural language features of this API that you can play around with as well as endpoints for tracking exercise activity.

Check out the provided [documentation](https://docs.google.com/document/d/1_q-K-ObMTZvO0qUEAxROrN3bwMujwAN25sLHwJzliK0/edit) for common uses of the different endpoints and for inspiration of what features to add to you app.

Another direction you can go in would be to present the data in a more meaningful way by building out a web app. How you create the application is entirely up to you.

## Requesting Data

See [Nutritionix API endpoints](https://trackapi.nutritionix.com/docs/#/) for a list of available endpoints. Documentation for general use can be found [here](https://developer.nutritionix.com/docs/v2).

You can use a tool such as [RestClient](https://github.com/rest-client/rest-client) or [HTTParty](https://github.com/jnunemaker/httparty) to make HTTP requests. Here is an example of a call that you can make to search for the nutritional value of a Big Mac.

```
$ gem install 'rest-client'
```
```
$ irb
irb(main):001:0> require 'rest-client'
=> true
irb(main):002:0> headers = {:"x-app-id"=>"8c...48", :"x-app-key"=>"87...ee"}
=> {:"x-app-id"=>"8c...48", :"x-app-key"=>"87...ee"}
irb(main):003:0> body = {"query":"1 Big Mac"}
=> {:query=>"1 Big Mac"}
irb(main):004:0> url = "https://trackapi.nutritionix.com/v2/natural/nutrients"
=> "https://trackapi.nutritionix.com/v2/natural/nutrients"
irb(main):005:0> response = RestClient.post(url, body, headers)
=> <RestClient::Response 200 "{\"foods\":[{...">
irb(main):006:0> require 'json'
=> true
irb(main):007:0> JSON.parse(response.body)
=> {"foods"=>[{"food_name"=>"big mac", "brand_name"=>nil, "serving_qty"=>1, "serving_unit"=>"burger", "serving_weight_grams"=>212, "nf_calories"=>540, "nf_total_fat"=>28, "nf_saturated_fat"=>10, "nf_cholesterol"=>80, "nf_sodium"=>950, "nf_total_carbohydrate"=>45, "nf_dietary_fiber"=>3, "nf_sugars"=>9, "nf_protein"=>25, "nf_potassium"=>nil, "nf_p"=>nil, "full_nutrients"=>[{"attr_id"=>203, "value"=>25}, {"attr_id"=>204, "value"=>28}, {"attr_id"=>205, "value"=>45}, {"attr_id"=>208, "value"=>540}, {"attr_id"=>269, "value"=>9}, {"attr_id"=>291, "value"=>3}, {"attr_id"=>301, "value"=>100}, {"attr_id"=>303, "value"=>4.5}, {"attr_id"=>307, "value"=>950}, {"attr_id"=>318, "value"=>500}, {"attr_id"=>401, "value"=>1.2}, {"attr_id"=>601, "value"=>80}, {"attr_id"=>605, "value"=>1}, {"attr_id"=>606, "value"=>10}], "nix_brand_name"=>"McDonald's", "nix_brand_id"=>"513fbc1283aa2dc80c000053", "nix_item_name"=>"Big Mac", "nix_item_id"=>"513fc9e73fe3ffd40300109f", "upc"=>nil, "consumed_at"=>"2020-01-08T05:18:18+00:00", "metadata"=>{"is_raw_food"=>false}, "source"=>1, "ndb_no"=>21237, "tags"=>{"item"=>"mcdonalds big mac", "measure"=>nil, "quantity"=>"1.0", "food_group"=>nil, "tag_id"=>2583}, "alt_measures"=>[], "lat"=>nil, "lng"=>nil, "meal_type"=>5, "photo"=>{"thumb"=>"https://d2xdmhkmkbyw75.cloudfront.net/2583_thumb.jpg", "highres"=>"https://d2xdmhkmkbyw75.cloudfront.net/2583_highres.jpg", "is_user_uploaded"=>false}, "sub_recipe"=>nil}]}
```