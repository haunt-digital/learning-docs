class ExternalResource < ActiveRecord::Base
  include RendersMarkdown
  include AutoHtml

  auto_html_for :uri do
    html_escape

    soundcloud
    flickr
    gist
    google_map
    google_video
    youtube(:width => 400, :height => 250)
    hashtag
    ted
    twitter
    vimeo
    youtube_js_api
    liveleak
    instagram
    image
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  renders_markdown :description
end
