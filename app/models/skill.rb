class Skill < ActiveRecord::Base
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :competencies, :touch => true

  after_save :touch_competencies

  has_attached_file :banner, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => 'missing.jpg'

  validates :title, presence: true, length: { maximum: 128 }
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  include RendersMarkdown
  renders_markdown :description

  include IsCompletable
  points_for_completion 50
  completion_type_name 'Skill'

  include RelaysCollectionCompleteness
  relays_completeness_for_collections :tasks

  def touch_competencies
    competencies.each { |competency| competency.touch }
  end
end
