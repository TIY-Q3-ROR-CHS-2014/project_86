module ApplicationHelper
  def is_link_active? clicked_controller
    "active" if clicked_controller == params[:controller]
  end

  def to_money number
    "$ #{sprintf( "%0.02f", number)}"
  end
end
