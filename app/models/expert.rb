# frozen_string_literal: true

class Expert < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :users, through: :events
  belongs_to :category
  belongs_to :user
  belongs_to :level, optional: true
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :protocols, dependent: :destroy

  validates :category, presence: false

  scope :searcher, lambda { |params|
    search_scope = Expert.all
    search_scope = search_scope.query(params[:query]) if params[:query].present?
    search_scope = search_scope.filters(params[:filter]) if params[:filter].present?
    search_scope
  }
  scope :query, lambda { |params|
    where('full_name ILIKE :search', search: "%#{params}%")
      .or(where(category_id: Category.where('name ILIKE :search', search: "%#{params}%").ids))
  }
  scope :filters, lambda { |parameter|
    case parameter
    when 'upexperience'
      order(experience: :asc)
    when 'downexperience'
      order(experience: :desc)
    when 'upcategory'
      order(level_id: :desc)
    else
      order(level_id: :asc)
    end
  }

  def rating
    return 0 if comments.empty?
    comments.sum(&:rating).to_f / comments.count
  end
end
