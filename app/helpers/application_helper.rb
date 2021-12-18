module ApplicationHelper
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def render_stars(value)
    output = ''
    value.times { output += "<i class='fas fa-star gold-star'></i>" } +
      (5 - value).times { output += "<i class='far fa-star gold-star'></i>" }
    sanitize(output)
  end
end
