xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "#{settings.title}"
  xml.subtitle "#{settings.subtitle}"
  xml.id "urn:uuid:#{settings.uuid}"
  xml.link "href" => "#{settings.url}"
  xml.link "href" => "#{settings.url}/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author do
    xml.name "#{settings.author}"
    xml.email "#{settings.email}"
  end
  xml.generator "Middleman", "uri" => "http://middlemanapp.com/"

  article = @atom_article
  xml.entry do
    xml.title article.title
    xml.link "rel" => "alternate", "href" => article.url
    xml.id "urn:uuid:#{UUID.create_sha1(settings.url + article.url, UUID::NameSpace_URL)}"
    xml.published article.date.to_time.iso8601
    xml.updated article.date.to_time.iso8601
    xml.author do
      xml.name "#{settings.author}"
      xml.email "#{settings.email}"
    end
    xml.summary article.summary, "type" => "html"
    xml.content article.body, "type" => "html"
  end
end