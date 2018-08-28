
class Answer < ApplicationRecord
    acts_as_voteable
    belongs_to :question
    has_many :comments, as: :commentable
    validates :description, presence: true
end
