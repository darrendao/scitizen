$image_types = ['ccam_images', 'fcam_images', 'rcam_images', 'ncam_images', 'mastcam_left_images', 'mastcam_right_images', 'mahli_images', 'mardi_images']


def get_images_for_sol(sol_url)
  image_urls = []
  ret = RestClient.get sol_url
  json_data = JSON.parse(ret)
  $image_types.each do |type|
    next unless json_data[type]

    image_groups = json_data[type]
    image_groups.each do |group|
      group['images'].each do |image|
        image_urls << image['url']
        next if Image.where(url: image['url']).exists?

        # skip images that are smaller than desired
        next if image['dimensions'].nil? or image['dimensions']['area'].nil?
        next if image['dimensions']['area'].any?{|dim| dim < 1000}

        begin
          Image.create(url: image['url'], sol: json_data['sol'].to_i, camera_type: image['instrument'], image_time: DateTime.strptime(image['time']['creation_timestamp_utc'], '%Y-%m-%dT%H:%M:%S')) 
        rescue => e
          puts "Failed to populate data for #{image['url']} because #{e.inspect} #{image['time']['creation_timestamp_utc']}"
        end
      end
    end
  end
  return image_urls
end

namespace :populate_image do
  desc "Fetch MSL images"
  task get_msl_images: :environment do
    main_url = 'https://msl-raws.s3.amazonaws.com/images/image_manifest.json'
    ret = RestClient.get main_url
    json_data = JSON.parse(ret)
    sols_data = json_data['sols']

    images = []
    sols_data.each do |sol_data|
      sol_image_urls = get_images_for_sol sol_data['url']
      images.concat(sol_image_urls)
    end
  end
end
