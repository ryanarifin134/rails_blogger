class Article < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :comments

  # Returns a comma separated list of the article's tags
  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
    tags = tags_string.split(',')
            .collect { |tag| tag.strip.downcase }.uniq

    new_or_found_tags = tags.collect do |tag_name|
      Tag.find_or_create_by(name: tag_name)
    end

    self.tags = new_or_found_tags
  end
end
