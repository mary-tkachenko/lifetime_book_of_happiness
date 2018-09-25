class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_search
  # GET /posts
  # GET /posts.json
  def index
    if params[:tag]
      @posts_taged = Post.tagged_with(params[:tag]).sort_by &:created_at
    end
    
    @unique_years = Post.select("date").map{ |i| i.date.year }.uniq
    @unique_months = [
      ['January', 1],
      ['February', 2],
      ['March', 3],
      ['April', 4],
      ['May', 5],
      ['June', 6],
      ['July', 7],
      ['August', 8],
      ['September', 9],
      ['October', 10],
      ['November', 11],
      ['December', 12],
    ]

    if params[:year] == 'all' or not params.key?(:year)
      @posts = Post.all.order(:created_at)
    else
      @posts = Post.where('extract(year from date) = ?', params[:year]).order(:created_at)
    end

    if params[:month] and params[:month] != 'all'
      @posts = @posts.where('extract(month from date) = ?', params[:month]).order(:created_at)
    end

    if params[:q] and params[:q] != '' 
      @your_search = Post.where("text like ?", "%#{params[:q]}%").order(:created_at)
    end
  end

  def book
  end

  def book_year
    @unique_years = Post.select("date").map{ |i| i.date.year }.uniq
    @unique_months = [
      ['January', 1],
      ['February', 2],
      ['March', 3],
      ['April', 4],
      ['May', 5],
      ['June', 6],
      ['July', 7],
      ['August', 8],
      ['September', 9],
      ['October', 10],
      ['November', 11],
      ['December', 12],
    ]

    if params[:year] == 'all' or not params.key?(:year)
      @posts = Post.all.order(:created_at)
    else
      @posts = Post.where('extract(year from date) = ?', params[:year]).order(:created_at)
    end

    if params[:month] and params[:month] != 'all'
      @posts = @posts.where('extract(month from date) = ?', params[:month]).order(:created_at)
    end
  end

  def book_tag
    @tags  = Post.tagged_with(params[:search])
    # @tags = Post.tagged_with("name like ?", params[:search])
  end

  # GET /posts/1
  # GET /posts/1.jsoncle
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def tags
    
  end

  def gallery
    @posts = Post.all
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    # post_params = {
    #   text: params[:post][:text],
    #   date: params[:post][:date],
    # }
    
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:text, :date, :tag_list, :latitude, :longitude, uploads: [])
    end

    def set_search
      @search = Post.search(params[:q])
    end


end
