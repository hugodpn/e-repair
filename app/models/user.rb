# == Schema Information
# Schema version: 20100506011630
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  login              :string(255)     not null
#  first_name         :string(255)
#  last_name          :string(255)
#  phone              :string(255)
#  address            :string(255)
#  email              :string(255)     not null
#  crypted_password   :string(255)     not null
#  password_salt      :string(255)     not null
#  persistence_token  :string(255)     not null
#  login_count        :integer(4)      default(0), not null
#  failed_login_count :integer(4)      default(0), not null
#  last_request_at    :datetime
#  current_login_at   :datetime
#  last_login_at      :datetime
#  current_login_ip   :string(255)
#  last_login_ip      :string(255)
#  language           :string(255)     default("es")
#  is_admin           :boolean(1)
#  is_enabled         :boolean(1)
#  created_at         :datetime
#  updated_at         :datetime
#

class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_permissible
  has_many :repairs
  has_many :request_repairs

  def has_perm? perm="generic"
    if self.is_admin and self.login == "admin"
      return true
    else
      self.has_permission?(perm)
    end
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Email.deliver_password_reset_instructions(self)
#    Notifier.deliver_password_reset_instructions(self)
  end

end
