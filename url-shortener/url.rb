# == Schema Information
#
# Table name: urls
#
#  id                :integer          not null, primary key
#  path              :string
#  short_code         :string
#  visit_count       :integer          default(0)
#  admin_disabled    :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# add_index :urls, :short_code, unique: true

class Url < ApplicationRecord

  validates :path, :format => URI::regexp(%w(http https))

  before_create :create_short_code

  def create_short_code
    self.short_code = SecureRandom.urlsafe_base64(4)
    until self.class.where(short_code: self.short_code).empty?
      self.short_url = SecureRandom.urlsafe_base64(4)
    end
  end

end
