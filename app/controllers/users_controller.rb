class UsersController < ApplicationController
  def index
    @users = User.all
    @agent = request.user_agent.downcase
    delim = if @agent.index('iphone') || @agent.index('ipad')
      iOSVersion = ((@agent.match(/\b[0-9]+_[0-9]+(?:_[0-9]+)?\b/))[0].split('_')[0]).to_i
      iOSVersion < 8 ?  ';' : '&'
    else
      '?'
    end
    redirect_to "sms: 907654736#{delim}body=this is a body text"
  end

  def show
    @user = User.find_by(id: params[:id].to_i)
  end
end
