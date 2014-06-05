require "search_in_file/version"
require 'find'

require "file_parsers/txt_parser"
require "file_parsers/pdf_parser"
require "file_parsers/doc_parser"
require "file_parsers/docx_parser"

module SearchInFile

  # search files by phrase
  def self.search( dir_path, term )
    results = []
    each_file_in( dir_path ) do |path|  
      # read file
      parser_class    = Object.const_get( "#{File.extname( path )[1..-1].capitalize}Parser" )
      file_content    = parser_class.new.read_file( path )
      file_paragraphs = file_content.split(/\tor\n|\n/)
      # search for phrase
      paragraphs = []
      file_paragraphs.each{ |p| paragraphs << p if p.include?(term) }
      results << {file: path, paragraphs: paragraphs} if !paragraphs.empty?
    end
    results
  end

  def self.content_of file
    class_name   = "#{extname( file )[1..-1].capitalize}Parser"
    parser_class = Object.const_get( class_name )
    file_content = parser_class.new.read_file( file )
  end

  def self.paragraphs_of file
    content_of( file ).split(/\tor\n|\n/)
  end

  def self.find_by_type_in d_path, f_type
    f_paths = []
    Find.find( d_path ){ |f| f_paths << f if extname?( f, f_type ) }
    f_paths
  end

  def self.find_all_in d_path
    f_paths = []
    Find.find( d_path ){ |f| f_paths << f if is_document?( f ) }
    f_paths
  end

  def self.each_file_in d_path
    Find.find( d_path ){ |f| yield( f ) if is_document?( f ) && block_given? }
  end

  def self.extname file
    File.extname( file )
  end

  def self.extname? file, type
    extname( file ) == type
  end

  def self.is_document? f_name
    f_type = extname( f_name )
    ['.doc', '.docx', '.pdf', '.txt'].include? f_type
  end    

end
