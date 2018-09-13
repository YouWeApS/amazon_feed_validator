RSpec.shared_context :empty_envelope do
  let(:feed) do |**options|
    options.reverse_merge! \
      type: 'Product',
      purge: false

    options = Hashie::Mash.new options unless options.is_a? Hashie::Mash

    <<-XML.strip_heredoc
      <?xml version="1.0" encoding="UTF-8"?>
      <AmazonEnvelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="amzn-envelope.xsd">
        <Header>
          <DocumentVersion>1.02</DocumentVersion>
          <MerchantIdentifier>ACYWTJAVSSWNQ</MerchantIdentifier>
        </Header>
        <MessageType>#{options.type}</MessageType>
        <PurgeAndReplace>#{options.purge}</PurgeAndReplace>
      </AmazonEnvelope>
    XML
  end
end
