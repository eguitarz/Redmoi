class RegistrationsController < Devise::RegistrationsController

  after_filter :init_settings, :only => :create

  protected

    def init_settings
      # create default settings somehow
      # maybe calling a method from user model
    end

end
