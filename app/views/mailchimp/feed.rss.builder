xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "HSBoxScoresNYC Newsletter"
    xml.description "The latest news around NYC high school basketball"
    xml.link "http://www.hsboxscoresnyc.com"
    xml.language "en"

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid("hsboxscores-#{post.id}", "isPermaLink" => "false")
        xml.description post.excerpt
      end
    end
  end
end
