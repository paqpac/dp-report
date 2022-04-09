class Dp < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category 
  belongs_to :return 
  belongs_to :source
  
  belongs_to :user
  has_one_attached :image


  validates :name, presence: { message: "商品名を記入してください" }
  validates :product_number, presence: { message: "品番を記入してください" }
  validates :category_id, numericality: {other_than: 0, message: "不良品の種類を選んでください"}
  validates :summary, presence: { message: "不良内容を記入してください" }

  def self.search(search)
    if search != ""
      Dp.where('name LIKE(?)', "%#{search}%").or(Dp.where('product_number LIKE(?)', "%#{search}%"))
    else
      Dp.all
    end
  end
end