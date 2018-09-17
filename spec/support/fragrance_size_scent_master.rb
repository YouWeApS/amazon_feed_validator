RSpec.shared_context :fragrance_size_scent_master do |**options|
  options.reverse_merge! \
    browser_node: 123456,
    parentage: :parent,
    variation: 'Size-Scent',
    type: 'Fragrance',
    gender: 'male',
    count: 1,
    size: '50ml',
    scent: 'Sea Lion',
    color: 'Blue'

  options = Hashie::Mash.new options unless options.is_a? Hashie::Mash

  let(:feed) do
    <<-XML.strip_heredoc
      <Beauty>
        <ProductType>
          <#{options.type}>
            <VariationData>
              <Parentage>#{options.parentage}</Parentage>
              <VariationTheme>#{options.variation}</VariationTheme>
              <Size>#{options.scent}</Size>
              <Color>#{options.color}</Color>
              <ColorMap>#{options.color}</ColorMap>
              <Scent>#{options.scent}</Scent>
            </VariationData>
            <Count>#{options.count}</Count>
            <TargetGender>#{options.gender}</TargetGender>
            <SizeMap>#{options.size}</SizeMap>
          </#{options.type}>
        </ProductType>
      </Beauty>
    XML
  end
end
