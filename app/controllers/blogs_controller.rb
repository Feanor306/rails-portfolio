class BlogsController < ApplicationController
  before_action :set_blog, only: [ :show, :edit, :update, :destroy, :toggle_status ]
  before_action :set_sidebar_topics, except: [:update, :create, :destroy, :toggle_status]
  layout "blog"
  access all: [:show, :index], 
    user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, 
    site_admin: :all

  # GET /blogs or /blogs.json
  def index
    if logged_in?(:site_admin)
      @blogs = Blog.recent.page(params[:page]).per(5)
    else
      @blogs = Blog.published.recent.page(params[:page]).per(5)
    end
    @page_title = "Portfolio Blog | Feanor306"
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    if logged_in?(:site_admin) || @blog.published
      # Better performance with .includes (fewer DB queries)
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new

      @page_title = @blog.title
    else
      redirect_to blogs_path, notice: "Unauthorized"
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: "Blog was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: "Blog was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end

    redirect_to blogs_path, notice: "Post status updated!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body, :topic_id, :status)
    end

    def set_sidebar_topics
      @sidebar_topics = Topic.with_blogs
    end
end
