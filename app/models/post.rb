class Post < ActiveRecord::Base

  validates :title, presence: {message: "must be provided"},
                    uniqueness: true

  validates :body, presence: true            

end
