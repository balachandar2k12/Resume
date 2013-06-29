class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end
  
  
  def home
 
  end

  def create
    @authentication = Authentication.new(user_params)
    if @authentication.save
      redirect_to authentications_url, :notice => "Successfully created authentication."
    else
      render :action => 'new'
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
  
  private
  def user_params
    params.require(:authentication).permit(:user_id, :provider, :uid)
  end

end
