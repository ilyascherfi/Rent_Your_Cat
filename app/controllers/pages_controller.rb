class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home


  def home
  end

  def destroy
    
    redirect_to  pages_path
  end

end
