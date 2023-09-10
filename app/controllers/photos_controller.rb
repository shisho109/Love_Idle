class PhotosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
    def index
        @photos = Photo.all
    end

    def new
        @photo = Photo.new
      end
    
      def create
        photo = Photo.new(photo_params)
        
        photo.user_id = current_user.id
        if photo.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @photo = Photo.find(params[:id])
        @reviews = @photo.reviews
        @review = Review.new
      end

      def edit
        @photo = Photo.find(params[:id])
      end

      def update
        photo = Photo.find(params[:id])
        if photo.update(photo_params)
          redirect_to :action => "show", :id => photo.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        photo = Photo.find(params[:id])
        photo.destroy
        redirect_to action: :index
      end
    
      private
      def photo_params
        params.require(:photo).permit(:group, :name, :about, :image)
      end
end