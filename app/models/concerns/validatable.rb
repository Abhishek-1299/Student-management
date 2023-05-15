module Validatable
	extend ActiveSupport::Concern

	included do
		validates :name, presence: true, uniqueness: true, :uniqueness => true
		validates :description, length: { in: 20..1000 }

		scope :current_month, -> { where(created_at: Date.today.beginning_of_month...Date.today.end_of_month)}
	end
end