require 'redcarpet/compat'

module PagesHelper
  def markdown_content(content)
    markdown = Markdown.new(content).to_html
    render(inline: markdown)
  end
end
