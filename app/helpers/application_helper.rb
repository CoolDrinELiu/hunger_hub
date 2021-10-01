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
end
