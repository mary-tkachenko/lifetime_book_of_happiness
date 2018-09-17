class UsersController < ApplicationController
    def index
        # method: get
        # action: index
        # template: students/index.html.erb
       @current_user = current_user
      end

  
    
      def show
        # method: get
        # action: index
        # template: students/show.html.erb
     
      end
    
      def new
        # method: get
        # action: index
        # template: students/new.html.erb
      end
    
      def edit
        # method: get
        # action: index
        # template: students/edit.html.erb
      end

      def sign_out
        @developer.destroy
        respond_to do |format|
          format.html { redirect_to developers_url, notice: 'Developer was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
end
