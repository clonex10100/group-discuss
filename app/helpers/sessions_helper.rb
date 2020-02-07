module SessionsHelper
  def valid_status(status)
    return '' if status == nil
    status ? " is-valid" : " is-invalid"
  end
end
