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
    youtube
    ted
    twitter
    vimeo
    liveleak
    image
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  renders_markdown :description
end
