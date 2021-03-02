# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

Warden::Strategies.add(:guest_user) do
    def valid?
      session[:guest_user_id].present?
    end
  
    def authenticate!
      u = User.where(id: session[:guest_user_id]).first
      success!(u) if u.present?
    end
  end