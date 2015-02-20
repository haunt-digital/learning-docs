class Task < ActiveRecord::Base
  has_and_belongs_to_many :skills

  has_many :task_components
  has_many :file_uploads, through: :task_components, source: :component, source_type: 'FileUpload'
  has_many :text_blocks, through: :task_components, source: :component, source_type: 'TextBlock'

  after_commit :touch_skills

  has_attached_file :banner, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => 'missing.jpg'

  validates :title, presence: true, length: { maximum: 128 }
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  markable_as :complete


  include RendersMarkdown
  renders_markdown :description

  include IsCompletable
  points_for_completion 20
  completion_type_name 'Task'


  def touch_skills
    skills.each { |skill| skill.touch }
  end

  def next_in_context_of(skill, user)
    current_index = skill.tasks.find_index { |task| task.id == self.id }

    skill.tasks.each_with_index do |task, i|
      if i > current_index
        unless task.marked_as? :complete, :by => user
          return task
        end
      end
    end

    return nil
  end
end
