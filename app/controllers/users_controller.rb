class UsersController < ApplicationController
    def index
       @current_user = current_user
    end

    
      def show
      end
    
      def new
      end
    
      def edit
      end

      def sign_out
        @developer.destroy
        respond_to do |format|
          format.html { redirect_to developers_url, notice: 'Developer was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      def create
        @user = User.create(user_params)

        respond_to do |format|
          if @user.save
            format.html { redirect_to @user, notice: 'User was successfully created.' }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end
    
    
      private
        def user_params
          # It's mandatory to specify the nested attributes that should be permitted.
          # If you use `permit` with just the key that points to the nested attributes hash,
          # it will return an empty hash.
          params.require(:user).permit(:nickname, :email)
        end

end
