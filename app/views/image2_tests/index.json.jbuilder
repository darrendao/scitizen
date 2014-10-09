json.array!(@image2_tests) do |image2_test|
  json.extract! image2_test, :id, :title, :description
  json.url image2_test_url(image2_test, format: :json)
end
