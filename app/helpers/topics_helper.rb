module TopicsHelper
  def preview(text)
    text.length > 150 ? text[0, 150] + "..." : text
  end
end
