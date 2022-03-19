# frozen_string_literal: true

# app/model/quotes
class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc)}
end
