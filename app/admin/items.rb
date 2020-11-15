ActiveAdmin.register Item do
  permit_params :name, :description, :markdown, :image, :price, category_ids: []
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :markdown
    column :price
    column :categories do |item|
      table_for item.categories.order("name ASC") do
        # I need to ask about this
        column(&:name)
      end
    end
  end

  show do
    attributes_table do
      row :name
      row :description
      row :markdown
      row :price
      table_for item.categories.order("name ASC") do
        column "Categories" do |category|
          link_to category.name, [:admin, category]
        end
      end
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
      f.input :categories, as: :check_boxes
    end
    f.actions
  end
end
