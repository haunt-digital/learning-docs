class Task < ActiveRecord::Base
  has_many :external_resources, dependent: :destroy

  validates :title, length: { maximum: 128 }

  markable_as :complete

  include RendersMarkdown

  renders_markdown :description

  def completion_date_for(user)
    mark = Markable::Mark.where(marker: user, markable: self).first
    mark.created_at
  end
end
