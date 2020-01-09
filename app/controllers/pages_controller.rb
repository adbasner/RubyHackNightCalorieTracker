class PagesController < ApplicationController
  def main
    search_param = params[:search] || ""
    @declaration = ""
    if search_param != ""
      api_key = Rails.application.credentials.dig(:nutritionix_api)
      headers = {"x-app-id": api_key[:app_id], "x-app-key": api_key[:app_key]}
      url = "https://trackapi.nutritionix.com/v2/natural/nutrients"
      body = {"query": search_param }
      begin
        response = RestClient.post(url, body, headers)
      rescue RestClient::ExceptionWithResponse => e
        e.response
      end
      
      if response != nil
        @declaration = "You searched for #{search_param}"
        @response = JSON.parse(response.body)
      else
        @declaration = "Couldn't find #{search_param}. Please Search again."
      end
    else 
      @declaration = "Search for a food item"
    end
  end
end
