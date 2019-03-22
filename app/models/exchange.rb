class Exchange < ApplicationRecord
  def self.add_by_url(url)
    uri = URI.parse(url)
    create!(
      name: uri.host,
      url: uri.scheme + '://' + uri.hostname,
      xml_url: url
    )
  end
end
