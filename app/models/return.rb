class Return < ActiveHash::Base
  self.data = [
    {id:0, name: '--'},
    {id:1, name: '有り'},
    {id:2, name: '無し'},
  ]

  include ActiveHash::Associations
  has_many :dps
  
end