
class WelcomeController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]

    def index
        # method: get
        # action: index
        # template: welcome/index.html.erb
       
      end
    
      def show
        # method: get
        # action: index
        # template: welcome/show.html.erb
        @user = User.find(session[:user_id])
      end
    
      def new
        # method: get
        # action: index
        # template: welcome/new.html.erb
      end
    
      def edit
        # method: get
        # action: index
        # template: welcome/edit.html.erb
      end
end
