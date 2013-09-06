module Rubyinsense
  module EncodeUrl
    def url_shortner(link)
      bitly_object = Bitly.new(BITLY_NAME, BITLY_API)
      ref_object = bitly_object.shorten(link)
      ref_object.short_url
    end
  end
end
