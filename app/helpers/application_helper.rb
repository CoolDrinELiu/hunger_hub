module ApplicationHelper
  def bootstrap_flash
    if flash[:alert].present?
      klass = "danger"
      txt = flash[:alert]
    elsif flash[:notice].present?
      klass = "success"
      txt = flash[:notice]
    else
      return
    end
    raw "<div class='alert alert-dismissible fade show alert-#{klass}' role='alert'>
          #{txt}
          <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
        </div>"
  end

  def link_to_settings
    s = Setting.first
    if s.present?
      link_to "Setting", edit_setting_path(s.id), class: "nav-link py-3 px-0 px-lg-3 rounded"
    else
      link_to "Setting", new_setting_path, class: "nav-link py-3 px-0 px-lg-3 rounded"
    end
  end
end
