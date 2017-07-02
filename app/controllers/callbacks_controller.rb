class CallbacksController < Devise::OmniauthCallbacksController

    def facebook
        callback_process
    end

    private

    def callback_process
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user
    end

end
