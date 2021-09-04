module ApplicationHelper

  def to_currency(value)
    ActionController::Base.helpers.number_to_currency(value, unit: "$", seperator: ".", delimiter: "," )
  end

  def flash_class(level)
    bootstrap_alert_class = {
      "success" => "alert-success",
      "error" => "alert-danger",
      "notice" => "alert-info",
      "alert" => "alert-danger",
      "warn" => "alert-warning"
    }
    bootstrap_alert_class[level]
  end

end
