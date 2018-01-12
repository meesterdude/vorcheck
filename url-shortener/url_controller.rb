class UrlController < ApplicationController

  # https://lend.to/xYzb
  # find the related URL and redirect to it
  def visit
    url = Url.where(short_code: params[:short_code]).first
    if url
      View.create(short_code: url.short_code)
      redirect_to url.path
    else
      render :status => 404
    end
  end

  # https://lendevor.com/url-shortner/xYzb
  # show the URL shortened address and view counts
  def show
    @url = Url.where(short_code: params[:short_code]).first
  end

  def new
  end

  # https://lendevor.com/url-shortner/
  # create the shortened URL
  def create
    if url = Url.create(url_params)
      redirect_to url_path(url)
    else
      render :new
    end
  end

  private

  def url_params
    params.require(:url).permit(:path)
  end

end
