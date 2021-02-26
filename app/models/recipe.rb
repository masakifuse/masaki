class Recipe < ApplicationRecord
  belongs_to :user#レシピは必ず1人に属する
  attachment :image


  with_options presence: true do
    validates :title#空白の投稿を弾く
    validates :body
    validates :image
  end
end
