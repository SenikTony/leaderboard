ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :country_id, :name, :points
  #
  # or
  #
  # permit_params do
  #   permitted = [:country_id, :name, :points]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :country
  filter :name
  filter :points

  index do
    selectable_column
    id_column
    column :name
    column :points
    column :country
    actions
  end
end
