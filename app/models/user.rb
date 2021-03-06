class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  def email_required?
    false
  end

  def email_changed? 
    false 
  end

  def will_save_change_to_email?
    false
  end

  before_save do
    self.user_type ||= 'user'
  end

  def is_admin?
    user_type == 'admin'
  end
end
