class PagesController < ApplicationController
  def main
    search_param = params[:search]
    @declaration = ""
    if search_param != ""
      api_key = Rails.application.credentials.dig(:nutritionix_api)
      headers = {"x-app-id": api_key[:app_id], "x-app-key": api_key[:app_key]}
      url = "https://trackapi.nutritionix.com/v2/natural/nutrients"
      body = {"query": search_param }

      response = RestClient.post(url, body, headers)
      if response != nil
        @declaration = "You searched for #{search_param}"
        @response = JSON.parse(response.body)
      else
        content_not_found
      end
    else 
      @declaration = "Search for a food item"
    end
  end
end
