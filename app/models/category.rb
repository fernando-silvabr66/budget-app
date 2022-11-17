class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
  validates :icon,
            format: {
              with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
              message: 'image url is not a valid URL'
            }
  def total_amount
    expenses.sum(:amount)
  end
end
