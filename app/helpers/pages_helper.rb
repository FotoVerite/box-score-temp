require 'redcarpet/compat'

module PagesHelper
  def markdown_content(content)
    markdown = Markdown.new(content).to_html.gsub('\n', '')
    render(inline: markdown)
  end
end
