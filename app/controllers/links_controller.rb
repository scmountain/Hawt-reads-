class LinksController < ApplicationController
 skip_before_filter :verify_authenticity_token, :only => [:create, :update]
  def index
    @links = Link.top_ten
  end

  def show
    @link = Link.top_link
  end

  def create
    link = Link.find_or_create_by(link_params)
      link.update(views: link.views += 1)
  end

private

  def link_params
    params.permit(:url)
  end
end
