
class Question < ApplicationRecord
    acts_as_voteable
    validates :title, :body, presence: true
    belongs_to :user
    has_many  :comments, as: :commentable
    has_many :answers
end



