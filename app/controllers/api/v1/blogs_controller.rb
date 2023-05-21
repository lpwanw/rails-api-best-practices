class Api::V1::BlogsController < Api::V1::BaseController
  def index
    json_response collection_serializer(blogs, BlogSerializer), :ok
  end

  def show
    json_response BlogSerializer.new(blog), :ok
  end

  def create
    blog = Blog.create! blog_params
    json_response BlogSerializer.new(blog), :created
  end

  def update
    blog.update!(blog_params)
    json_response BlogSerializer.new(blog), :ok
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def blog
    @blog ||= Blog.find params[:id]
  end

  def blogs
    @blogs ||= Blog.all
  end
end
