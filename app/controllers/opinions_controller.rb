class OpinionsController < ApplicationController
    before_action :authenticate_user!
      
    def create
      event = Event.find(params[:event_id])
      opinion = event.opinions.build(opinion_params)
      opinion.user_id = current_user.id
      if opinion.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
         end
      end
      
    private
      
      def opinion_params
        params.require(:opinion).permit(:content)
      end
    end