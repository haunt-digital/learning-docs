class ExternalResource < ActiveRecord::Base
  belongs_to :task

  validates :title, length: { maximum: 128 }

  include RendersMarkdown

  renders_markdown :description

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
end
