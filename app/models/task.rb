class Task < ActiveRecord::Base
  has_many :external_resources, dependent: :destroy
  has_and_belongs_to_many :skills

  has_attached_file :banner, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates :title, length: { maximum: 128 }
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  markable_as :complete

  include RendersMarkdown

  renders_markdown :description


  def self.points_for_completion
    20
  end

  def self.presentation_name
    'Task'
  end


  def completion_date_for(user)
    mark = Markable::Mark.where(marker: user, markable: self).first
    mark.created_at
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
