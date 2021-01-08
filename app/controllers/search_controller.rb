class SearchController < ApplicationController
  
  def index 
    @poems = ::PoemSearchFacade.get_poems(params[:author])
  end
  
end
