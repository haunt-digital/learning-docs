class Task < ActiveRecord::Base
  has_many :external_resources, dependent: :destroy

  validates :title, length: { maximum: 128 }

  include RendersMarkdown

  renders_markdown :description

end
