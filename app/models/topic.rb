class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  
  scope :visible_to, -> (user) { user ? all : where(public: true) }
  scope :publicly_visible, -> {user ? all : where(public: true) }
  scope :private_visible, -> {user ? all : where(public:false) }
end
