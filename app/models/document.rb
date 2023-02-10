class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :attached_document
end
