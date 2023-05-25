class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, format: { with: /.{6,}/, message: 'Comment must have at least six characters.' }
  validates :movie_id, uniqueness: { scope: :list_id }
end
