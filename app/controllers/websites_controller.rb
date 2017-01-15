class WebsitesController < ApplicationController
  def index
    @websites = current_user.websites
  end

  def new
    @website = Website.new
  end

  def create
    @website = current_user.websites.create(website_params)

    if @website.save
      redirect_to @website
    else
      render 'new'
    end
  end

  def show
    @website = Website.find(params[:id])
  end

  def edit
    @website = Website.find(params[:id])
  end

  def update
    @website = Website.find(params[:id])

    if @website.update(website_params)
      redirect_to @website
    else
      render 'edit'
    end
  end

  def destroy
    @website = Website.find(params[:id])
    @website.destroy
    redirect_to websites_path
  end

  private
    def website_params
      params.require(:website).permit(:title, :contact_us, :beliefs)
    end
end
