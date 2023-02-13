class AuthorsController < ApplicationController
  
  before_action :authenticate_author! # authenticate author first
  layout 'application'
  
  def show
  end
end
