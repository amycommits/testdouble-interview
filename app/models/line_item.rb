# == Schema Information
#
# Table name: line_items
#
#  id                   :integer          not null, primary key
#  invoice_id           :integer          not null
#  product_id           :integer
#  service_id           :integer
#  price_override_cents :integer
#  quantity             :integer          default(1), not null
#  description          :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class LineItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :product, :optional => true
  belongs_to :service, :optional => true

  validate :must_be_product_or_service

  def must_be_product_or_service
    if product.blank? && service.blank?
      errors.add(:base, "A line item must be either a product or a service")
    elsif product.present? && service.present?
      errors.add(:base, "A line item can't be both a product and a service")
    end
  end
  def display_cents(currency)
    if product_id.present?
      cents = product.price_cents
    else
      cents = service.price_cents
    end 
    cents = price_override_cents if price_override_cents.present?
    translate_cents(cents, currency)
  end

  private

    def translate_cents(cents, currency)
      # forex stuff
      cents
    end
end
