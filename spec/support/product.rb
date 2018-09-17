RSpec.shared_context :product do |**options|
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
    size_map: 'Large',
    xml: nil

  options = Hashie::Mash.new options unless options.is_a? Hashie::Mash

  let(:feed) do
    <<-XML.strip_heredoc
      <Product>
        <SKU>prod1</SKU>
        <StandardProductID>
          <Type>#{options.id_type}</Type>
          <Value>#{options.id}</Value>
        </StandardProductID>
        <ProductTaxCode>#{options.tax_code}</ProductTaxCode>
        <Condition>
          <ConditionType>#{options.condition}</ConditionType>
        </Condition>
        <DescriptionData>
          <Title>#{options.title}</Title>
          <Brand>#{options.brand}</Brand>
          <Description>#{options.description}</Description>
          <Manufacturer>#{options.manufacturer}</Manufacturer>
          <RecommendedBrowseNode>#{options.browser_node}</RecommendedBrowseNode>
        </DescriptionData>
        <ProductData>
          #{options.xml}
        </ProductData>
      </Product>
    XML
  end
end
