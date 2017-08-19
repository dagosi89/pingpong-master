class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  def matches
    Match.where("player1_id = :user_id OR player2_id = :user_id", user_id: self.id)
  end

  def opponents
    self.class.where.not(id: id)
  end
end
