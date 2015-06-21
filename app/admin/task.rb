ActiveAdmin.register Task do
  menu :label => "Tasks"
  menu :priority => 4

  belongs_to :skill, :optional => true

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
    column 'Title' do |task|
      link_to task.title, admin_task_path(task), :class => "member_link"
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
      f.input :body
      f.input :banner, :as => :file, :hint => image_tag(f.object.banner.url(:medium))
      f.input :skills, :as => :select, :collection => Skill.all
    end

    f.actions
  end


  # Sidebar filters
  filter :title
  filter :created_at, :label => 'Created on'
  filter :updated_at, :label => 'Last edited'
end
