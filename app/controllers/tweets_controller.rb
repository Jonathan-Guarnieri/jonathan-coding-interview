class TweetsController < ApplicationController
  def index
    tweets = Tweet
               .by_user(params[:user_id])
               .paginate(index_page)

    render json: tweets
  end

  private

  def search_params
    params.permit(:page)
  end

  def index_page
    search_params[:page] || 1
  end
end
