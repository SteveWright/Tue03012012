class ConversationsController < ApplicationController
  before_filter :load_board
  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @conversations }
    end
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @conversation }
    end
  end

  # GET /conversations/new
  # GET /conversations/new.json
  def new
    @conversation = Conversation.new
    @comment = @conversation.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @conversation }
    end
  end
  
  def reply
    @conversation = load_parent
    @comment = @conversation.comments.build

    respond_to do |format|
      format.html { render :action => "new" }# new.html.erb
      format.xml { render :xml => @conversation }
    end
  end

  # GET /conversations/1/edit
  def edit
    @conversation = Conversation.find(params[:id])
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(params[:conversation])
    @comment = @conversation.comments.build(params[:comment])
    @conversation.board = @board
  
  @conversation = Conversation.new(params[:conversation])
    @comment = @conversation.comments.build(params[:comment])
    @conversation.board = @board
  end

  # PUT /conversations/1
  # PUT /conversations/1.json
  def update
    @conversation = Conversation.find(params[:id])

   respond_to do |format|
      if @conversation.update_attributes(params[:conversation])
        format.html { redirect_to(@conversation, :notice => 'Conversation was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @conversation.errors, :status => :unprocessable_entity }
      end
    end 
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    respond_to do |format|
      format.html { redirect_to conversations_url }
      format.xml { head :ok }
    end
  end
  
  private
  
  def load_board
    @board = Board.find(params[:board_id]);
                 
    unless @board
   
    end
  end
  
  def load_parent
  	Conversation.find(params[:id])
  end
end
