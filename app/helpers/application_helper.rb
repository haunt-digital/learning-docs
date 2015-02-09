module ApplicationHelper

  def truncate(html, count = 15)
    TypoHero.truncate(html, count)
  end
end
