json.array!(@image_annotations) do |image_annotation|
  json.extract! image_annotation, :id, :image_src, :shapes, :user_id
  json.url image_annotation_url(image_annotation, format: :json)
end
