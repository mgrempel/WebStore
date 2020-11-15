ActiveAdmin.register Item do
  permit_params :item_name, :description, :markdown, :image, :price

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
