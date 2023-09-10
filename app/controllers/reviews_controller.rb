class ReviewsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      photo = Photo.find(params[:photo_id])
      review = photo.reviews.build(review_params)
      review.user_id = current_user.id
      if review.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
  
    private
  
      def review_params
        params.require(:review).permit(:content)
      end
  end