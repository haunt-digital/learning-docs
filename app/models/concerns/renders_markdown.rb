module RendersMarkdown
  extend ActiveSupport::Concern

  module ClassMethods
    def renders_markdown(field)
      define_method("#{field}_markdown".to_sym) do
        read_attribute(field)
      end

      define_method("#{field}_html".to_sym) do
        renderer = Redcarpet::Markdown.new(
          Redcarpet::Render::HTML,
          autolink: true, tables: true, lax_spacing: true
        )
        html = renderer.render(read_attribute(field))
        TypoHero.enhance(html)
      end
    end
  end
end
