json.array!(@images) do |image|
  json.extract! image, :id, :url, :sol, :camera_type
  json.url image_url(image, format: :json)
end
