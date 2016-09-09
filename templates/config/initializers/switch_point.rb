SwitchPoint.configure do |config|
  config.define_switch_point(
    :main,
    {
      readonly: :"#{Rails.env}_slave",
      writable: :"#{Rails.env}"
    }
  )
end
