class Return < ActiveHash::Base
  self.data = [
    {id:0, name: '--'},
    {id:1, name: 'ๆใ'},
    {id:2, name: '็กใ'},
  ]

  include ActiveHash::Associations
  has_many :dps
  
end