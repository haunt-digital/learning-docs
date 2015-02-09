class Skill < ActiveRecord::Base
  has_and_belongs_to_many :tasks

  # has_attached_file :banner, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates :title, length: { maximum: 128 }
  # validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  include RendersMarkdown

  renders_markdown :description
end
