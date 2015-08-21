class Post < ActiveRecord::Base

  has_many :comments

  validates :title, presence: {message: "must be provided"},
                    uniqueness: true

  validates :body, presence: true

  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
    where("body ILIKE ?", "%#{search}%")
  end

end
