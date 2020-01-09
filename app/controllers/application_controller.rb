class ApplicationController < ActionController::Base
  def content_not_found
    render 'pages#main'
  end
end
