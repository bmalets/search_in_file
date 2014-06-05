require 'docx'

class DocxParser

  def initialize
    @content = ''
  end

  def read_file file_path
    doc = Docx::Document.open( file_path )
    doc.paragraphs.each{ |p| @content << p.text }
    @content
  end

end