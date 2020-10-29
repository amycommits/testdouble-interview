# == Schema Information
#
# Table name: invoices
#
#  id         :integer          not null, primary key
#  client_id  :integer          not null
#  net_days   :integer          default(30), not null
#  note       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Invoice < ApplicationRecord
  belongs_to :client
  has_many :line_items
end
