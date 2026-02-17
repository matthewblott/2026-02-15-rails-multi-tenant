class SessionsController < ApplicationController
  before_action :require_user, only: :destroy

  skip_before_action :authenticate_user!, only: :create

  def create
    return redirect_to start_path if Current.user

    tenant_name = nil
    device_token = nil 

    # ApplicationRecord.with_tenant('default') do
      user = User.create!
      device_token = user.device_token
      tenant_name = user.id.to_s
    # end

    ApplicationRecord.create_tenant(tenant_name)

    # TenantProvisioner.create(tenant_name)

    cookies.permanent.encrypted[:device_token] = {
      value: device_token,
      httponly: true,
      secure: Rails.env.production?,
      same_site: :lax
    }

    Current.user = user

    redirect_to root_path

    # redirect_to user_todos_path(Current.user)
  end

  def destroy
    Current.user&.destroy
    cookies.delete(:device_token)
    redirect_to sign_in_path 
  end

  private

  def require_user
    redirect_to root_path unless Current.user
  end

end
