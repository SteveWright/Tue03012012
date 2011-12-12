class UserSessionsController < ApplicationController
	
  def new
    @user_session = UserSession.new
  end

  # POST /user_sessions
  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
    	redirect_to(:users, :notice => 'Login Successful') 
    else
        format.html { render :action => "new" }
        format.xml { render :xml => @user_session.errors, :status => :unprocessable_entity }
    end
 end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    
    redirect_to(homepage_url, :notice => 'Goodbye!')
    end
end
  
  
  
  
  