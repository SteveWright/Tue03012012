class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    @comments = Comment.page(params[:page]).per(5)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])
    @comments = Comment.page(params[:page]).per(5)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, :notice => 'Comment was successfully created.' }
        format.xml { render :xml => @comment, :status =>  :created, :location => @comment }
      else
        format.html { render action: "new" }
        format.xml { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, :notice =>  'Comment was successfully updated.' }
        format.xml { head :ok }
      else
        format.html { render action: "edit" }
        format.xml { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.xml { head :ok }
    end
  end
end
