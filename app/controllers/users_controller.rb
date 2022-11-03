class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
  end 



  def new
    @user = User.new
    
  end

  def create
    @user = User.new(first_name:params[:first_name], last_name:params[:last_name], 
    age:params[:age], description:params[:description], email:params[:email], 
    password:params[:password], 
    password_confirmation:params[:password_confirmation], city: City.all.sample)
    if @user.save
      flash[:notice] = "Uwu inscription réussie"
      redirect_to root_path
    else
      flash.now[:danger] = 'Mot de passe ou eMail Invalide, merci de recommencer !'
      render 'new'
    end  
  end  

  private

  def cities_list
    cities =[]
    City.all.each {|city| cities << city}
    return cities
  end

 
end
