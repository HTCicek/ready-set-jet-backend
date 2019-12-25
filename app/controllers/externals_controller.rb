class ExternalsController < ApplicationController
  def geddit
    url = params[:req_url]
    Faraday.get(url)
  end
end