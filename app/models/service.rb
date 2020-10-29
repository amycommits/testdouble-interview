# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  price_cents :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Service < ApplicationRecord
end
