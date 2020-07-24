class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all 
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  def new
    @blogger = Blogger.new
  end

  def edit
    @blogger = Blogger.find(params[:id])
  end

  def create
    @blogger = Blogger.new(blogger_params)

    if @blogger.save
      redirect_to @blogger
    else
      render :new
    end
  end

  def update
    @blogger = Blogger.find(params[:id])
    
    if @blogger.update
      redirect_to @blogger 
    else 
      render :edit
    end
  end

  def destroy
    @blogger = Blogger.find(params[:id])
    @blogger.destroy
    redirect_to bloggers_path
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
end