ActiveAdmin.register User do
  menu :label => "Users"
  menu :priority => 1

  controller do
    # Ignore empty password params when updating.
    # http://stackoverflow.com/questions/16610064/activeadmin-edit-devise-user-without-changing-password
    def update
      if params[:user][:password].empty?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end

    # Allow update/create actions under strong params.
    def resource_params
      return [] if request.get?
      [ params[active_admin_config.resource_class.name.underscore.to_sym].permit! ]
    end
  end

  # List view
  index do
    selectable_column

    column "User" do |user|
      link_to user.email, admin_user_path(user), :class => "member_link"
    end

    # column 'Powers', sortable: :role do |user|
    #   status_tag (user.role), (user.admin? ? :warning : :ok)
    # end

    column 'Locked', sortable: :access_locked?  do |user|
      status_tag (user.access_locked? ? 'Locked' : 'Unlocked'), (user.access_locked? ? :error : :ok)
    end

    column 'Last signed in at', :current_sign_in_at
    column 'Registered on', :created_at

    actions
  end

  # Update and Edit forms
  form do |f|
    f.semantic_errors # shows errors on :base
    inputs do
      f.input :email
      f.input :password
    end
    f.actions
  end

  # Full view
  show do |user|
    h3 user.email
    attributes_table do
      row :email
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :updated_at
    end
  end

  # Sidebar filters
  filter :email
  # filter :role, :as => :select, :collection =>  User.roles
  filter :created_at, :label => 'Registered on'
  filter :current_sign_in_at, :label => 'Last signed in'

  batch_action :lock do |ids|
    User.find(ids).each do |user|
      user.lock_access!
    end
    redirect_to collection_path, alert: "The users have been locked."
  end

  batch_action :unlock do |ids|
    User.find(ids).each do |user|
      user.unlock_access!
    end
    redirect_to collection_path, alert: "The users have been unlocked."
  end
end
