class Setting < ApplicationRecord
  include SettingHelper

  def self.get_setting(a_code)
    if !instance.respond_to? a_code
      instance.create_attr(a_code)
      setting = Setting.where('code' => a_code).first
      instance.send(a_code+"=", setting.value) if !setting.nil?
    end
    instance.send(a_code)
  end
end
