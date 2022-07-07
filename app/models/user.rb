class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_stock_exists(ticker)
    stock = Stock.check_data(ticker)
    return false unless stock
    stocks.where(id: stock.id).exists?
  end

  def is_friend_exists(friend_id)
    friends.where(id: friend_id).exists?
  end

  def under_limit
    stocks.count < 10
  end

  def can_track_more(ticker)
    under_limit && !is_stock_exists(ticker)
  end

  def fullname
   return "#{first_name} #{last_name}" if first_name || last_name
   "Anonymous"
  end

  def self.new_lookup(friend)
    data = User.where('first_name LIKE ? OR last_name LIKE ? OR email LIKE ?', "%#{friend}%","%#{friend}%","%#{friend}%")
  end
end
