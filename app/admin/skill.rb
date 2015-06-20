ActiveAdmin.register Skill do
  menu :label => "Skills"
  menu :priority => 3

  belongs_to :competency, :optional => true

  controller do
    # Allow update/create actions under strong params.
    def resource_params
      return [] if request.get?
      [ params[active_admin_config.resource_class.name.underscore.to_sym].permit! ]
    end
  end

  # List view
  index do
    selectable_column
    column 'Title' do |skill|
      link_to skill.title, admin_skill_path(skill), :class => "member_link"
    end

    column 'Tasks' do |skill|
      link_to skill.tasks.count.to_s + ' tasks', admin_skill_tasks_path(skill), :class => "member_link"
    end

    column 'Edited', :updated_at
    column 'Created', :created_at

    actions
  end

  # Update and Edit forms
  form do |f|
    f.semantic_errors # shows errors on :base
    inputs :multipart => true  do
      f.input :title
      f.input :description
      f.input :banner, :as => :file, :hint => image_tag(f.object.banner.url)
      f.input :competencies, :as => :select, :collection => Competency.all
    end

    f.actions
  end


  # Sidebar filters
  filter :title
  filter :created_at, :label => 'Created on'
  filter :updated_at, :label => 'Last edited'
end
