require 'win32ole'

class DocParser

  def initialize
    @content = ''
  end

  def read_file file_path
    begin
      word = WIN32OLE.connect( 'Word.Application' )
      doc  = word.activedocument
    rescue
      word = WIN32OLE.new( 'Word.Application' )
      doc  = word.documents.open( file_path )
    end
    word.visible = false
    doc.sentences.each{ |x| @content << x.text }
    doc.close
    word.quit
    @content
  end
end
