require 'pdf/reader'

class PdfParser

  def initialize
    @content = ''
  end

  def read_file file_path
    PDF::Reader.open(file_path) do |reader|
      reader.pages.each do |page|
        @content << page.text
      end
    end
    @content
  end

end