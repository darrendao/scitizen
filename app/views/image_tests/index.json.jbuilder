json.array!(@image_tests) do |image_test|
  json.extract! image_test, :id, :title, :description
  json.url image_test_url(image_test, format: :json)
end
