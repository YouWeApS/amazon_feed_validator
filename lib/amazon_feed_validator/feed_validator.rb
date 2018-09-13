module AmazonFeedValidator
  class FeedValidator
    XSDDIR = File.expand_path('./lib/xsd')

    attr_reader :feed, :options, :errors

    def initialize(feed, **options)
      @feed = Nokogiri::XML(feed)
      @options = Hashie::Mash.new options
    end

    def validate
      @errors = Nokogiri::XML::Schema(xsd_file(options.name)).validate(feed).map(&:to_s)
      errors.empty?
    end

    private

      def xsd_file(name)
        file = File.read File.expand_path sanitize_name(name), XSDDIR

        # Replace schema location references with ones pointing to local xsd files
        file.gsub! \
          'schemaLocation="',
          "schemaLocation=\"#{XSDDIR}/"
      end

      def sanitize_name(name)
        name ||= 'Product.xsd'
        name = "#{name}.xsd" unless name.include? '.xsd'
        name
      end
  end
end
