class TxtParser

  def initialize
    @content = ''
  end

  def read_file file_path
    File.open( file_path ).readlines.each do |line|
       @content << line
    end
    @content
  end

end