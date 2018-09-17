RSpec.shared_context :clothing_size_color_master do |**options|
  options.reverse_merge! \
    id_type: 'EAN',
    id: 'prod1-ean',
    tax_code: 'A_GEN_NOTAX',
    condition: 'New',
    title: 'Product 1',
    brand: 'Elite-Armor',
    description: 'Product description',
    manufacturer: 'Elite-Armor',
    browser_node: 123456,
    parentage: :parent,
    variation: 'Size-Material',
    type: 'Outerwear',
    color_map: 'Black',
    size_map: 'Large'

  options = Hashie::Mash.new options unless options.is_a? Hashie::Mash

  let(:feed) do
    <<-XML.strip_heredoc
      <Clothing>
        <VariationData>
          <Parentage>#{options.parentage}</Parentage>
          <VariationTheme>#{options.variation}</VariationTheme>
        </VariationData>
        <ClassificationData>
          <ClothingType>#{options.type}</ClothingType>
          <ColorMap>#{options.color_map}</ColorMap>
          <SizeMap>#{options.size_map}</SizeMap>
        </ClassificationData>
      </Clothing>
    XML
  end
end
