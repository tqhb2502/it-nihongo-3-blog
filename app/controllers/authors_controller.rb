class AuthorsController < ApplicationController
  before_action :authenticate_author! # authenticate author first
  
  layout 'authors' # set layout file
end
