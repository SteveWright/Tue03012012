class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    
    if current_user
    	redirect_to(homepage_url, :notice => 'Already Registered' )
    end
  end

  # GET /users/1/edit
  def edit
  	is_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user_session = UserSession.new(params[:user])
    
    respond_to do |format|
    	if @user.save && @user_session.save
        format.html { redirect_to(homepage_url, :notice => 'Registration successfull.') }
        else
        format.html { render :action => "new" }
        end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
  	is_user
   
  	respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml { head :ok }
    end
  end
  
  private
  
  def is_user
  	if User.exists?(params[:id])
  		@user = User.find(params[:id]);
  		if !current_user || current_user.id != @user.id
  			redirect_to(homepage_url, :notice => "You do not have access to that page")
  		end
  	  else
  	  	redirect_to(homepage_url, :notice => "You do not have access to that page")
  	  end
  end	  
end
