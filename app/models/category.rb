class Category < ActiveHash::Base
  self.data = [
    {id:0, name: '--'},
    {id:1, name: '部品不足'},
    {id:2, name: '箱破損'},
    {id:3, name: '生産時要因'},
    {id:4, name: '消費者要因(不良ではない疑念)'},
    {id:5, name: 'その他'},
  ]

  include ActiveHash::Associations
  has_many :dps
  
end