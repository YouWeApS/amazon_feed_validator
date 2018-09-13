require 'nokogiri'

namespace :amazon do
  desc 'Download XSD files recursively'
  task xsd: :environment do
    dest = download_xsd_file(
      'amzn-envelope.xsd',
      'https://images-na.ssl-images-amazon.com/images/G/01/rainier/help/xsd/release_1_9/'
    )
    # Validate schema
    Nokogiri::XML::Schema(File.open(dest))
    puts 'Done!'
  end

  def download_xsd_file(file_name, base_url, downloads: [])
    return if downloads.include?(file_name)

    puts "- downloading #{file_name}..."
    downloads << file_name
    destination = File.expand_path(file_name, './lib/xsd')
    FileUtils.mkdir_p File.dirname destination

    File.open(destination, 'w') do |f|
      IO.copy_stream(open(base_url + file_name), f)
    end

    raw_xml = Nokogiri::XML(File.open(destination))
    raw_xml.xpath('//xsd:include').each do |tag|
      file_name = tag.attribute('schemaLocation').value
      download_xsd_file(file_name, base_url, downloads: downloads)
    end

    destination
  end
end
