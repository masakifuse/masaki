class Recipe < ApplicationRecord
  belongs_to :user#レシピは必ず1人に属する
  attachment :image
end
