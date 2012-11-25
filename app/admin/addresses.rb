ActiveAdmin.register Address do
  form do |f|
      f.inputs :addressable_type, :addressable_id
  end
end
