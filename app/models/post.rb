class Post < ApplicationRecord
    before_validation :capitalize_category_name
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validates :title, format: { with: /Won't Believe|Secret|Top \d|Guess/i}
    # validate :true_facts

    # def true_facts
    #     if [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i].none? {|p| p.match(title)}
    #         errors.add(:title, "Not clickbait-y enough")
    #     end
    # end

    def capitalize_category_name
        if self.category
            self.category = self.category.split('-').map(&:capitalize).join('-')
        end
    end
end
