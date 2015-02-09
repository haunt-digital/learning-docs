class Task < ActiveRecord::Base
  has_many :external_resources, dependent: :destroy
  has_and_belongs_to_many :skills

  has_attached_file :banner, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates :title, length: { maximum: 128 }
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  markable_as :complete

  include RendersMarkdown

  renders_markdown :description

  def completion_date_for(user)
    mark = Markable::Mark.where(marker: user, markable: self).first
    mark.created_at
  end
end
