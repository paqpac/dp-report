class Category < ActiveHash::Base
  self.data = [
    {id:0, name: '--'},
    {id:1, name: '部品不足'},
    {id:2, name: '箱破損'},
    {id:3, name: '生産時所以'},
    {id:4, name: '消費者所以(NO不良)'},
    {id:5, name: 'その他'},
  ]

  include ActiveHash::Associations
  has_many :dps
  
end