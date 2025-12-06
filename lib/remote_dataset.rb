require 'open-uri'
require 'csv'

class RemoteDataset
  attr_reader :remote_url

  def initialize(remote_url)
    @remote_url = remote_url
  end

  def each
    pageNumber = 1
    pageSize = 50000
    offset = (pageNumber - 1) * pageSize

    uri = URI(remote_url)
    uri.query = URI.encode_www_form({ "$limit" => pageSize, "$offset" => offset, "$order" => "id ASC" })
    remote_url_with_pagination = uri.to_s

    csv = CSV.new(
      URI.open(remote_url_with_pagination),
      headers: true,
      header_converters: :symbol
    )

    while csv.count > 0
      csv.rewind

      csv.each do |row|
        yield row
      end

      pageNumber += 1
      offset = (pageNumber - 1) * pageSize

      uri = URI(remote_url)
      uri.query = URI.encode_www_form({ "$limit" => pageSize, "$offset" => offset, "$order" => "id ASC" })
      remote_url_with_pagination = uri.to_s

      csv = CSV.new(
        URI.open(remote_url_with_pagination),
        headers: true,
        header_converters: :symbol
      )
    end
  end
end