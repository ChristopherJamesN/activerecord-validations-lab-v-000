class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.title != nil
      unless record.title.include? 'Won\'t Believe' || 'Secret' || 'Top' || 'Guess'
        record.errors[:title] << 'Need a title with clickbait'
      end
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates_with MyValidator
end
