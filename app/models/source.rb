class Source < ActiveHash::Base
  self.data = [
    {id:0, name: '--'},
    {id:1, name: 'お店からの連絡(品出時等)'},
    {id:2, name: 'お客様からの連絡'},
    {id:3, name: 'その他'},
  ]

  include ActiveHash::Associations
  has_many :dps
  
end