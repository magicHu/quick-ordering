class UsersController < ApplicationController
  def setting
  end

  def update_setting
    respond_to do |format|
      if current_user.update_attributes(params[:user])
        format.html { redirect_to '/setting', notice: '用户设置已更新.' }
      else
        format.html { render action: "setting" }
      end
    end
  end
end
