ActiveAdmin.register Competency do
  menu :label => "Competencies"
  menu :priority => 2

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
    column 'Title' do |competency|
      link_to competency.title, admin_competency_path(competency), :class => "member_link"
    end

    column 'Skills' do |competency|
      link_to competency.skills.count.to_s + ' skills', admin_competency_skills_path(competency), :class => "member_link"
    end

    column 'Edited', :updated_at
    column 'Created', :created_at

    actions
  end

  # Sidebar filters
  filter :title
  filter :created_at, :label => 'Created on'
  filter :updated_at, :label => 'Last edited'
end
