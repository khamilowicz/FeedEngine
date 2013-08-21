class PhotoPost < Post
  alias_attribute :photo, :content

  validates_length_of :description, maximum: 256

  def render_content template
    template.render 'posts/photo', photo_url: photo
  end
end