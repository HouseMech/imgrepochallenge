class SavesToTempFile
  require 'tempfile'

  attr_reader :image

  def initialize(image)
    @image = image
  end


  def call
    downloaded_file = @image.photo.blob.download
    file = Tempfile.new('foo', Rails.root.join('tmp'))
    file.binmode
    file.write(downloaded_file)
    file.flush
    return file
  end
end
