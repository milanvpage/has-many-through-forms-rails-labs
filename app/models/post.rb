class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories_attributes)
    categories_attributes.vaules.each do |categories_attributes|
      if !categories_attributes[:name].empty?
        category = Category.find_or_create_by(categories_attributes)
        self.categories << category
      end
    end
  end


end
