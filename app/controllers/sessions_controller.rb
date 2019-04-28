class SessionsController < Devise::SessionsController
  
  private

  # def sign_in_params
  # 	params.require(:user).permit(:username,:password) if !params[:user].nil?
  # end
end