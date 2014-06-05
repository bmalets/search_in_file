require "search_in_file/version"
require "search_in_file/settings"

require "file_parsers/txt_parser"
require "file_parsers/pdf_parser"
require "file_parsers/doc_parser" if Gem.win_platform?
require "file_parsers/docx_parser"

require "find"

module SearchInFile

  def self.search( path, term )
    is_document?( path ) ? search_in_file( path, term ) : search_in_directory( path, term )
  end

  def self.search_in_directory( path, term )
    results = []
    each_file_in( path ) do |f_path| 
      f_result = search_in_file( f_path, term )
      results = results + f_result if !f_result.empty?
    end
    results
  end

  def self.search_in_file( f_path, term )
    term_paragraphs = []
    file_paragraphs = paragraphs_of( f_path )
    # search for phrase
    file_paragraphs.each{ |p| term_paragraphs << p if p.include?(term) }
    term_paragraphs.empty? ? [] : [{file: f_path, paragraphs: term_paragraphs}]    
  end

  def self.content_of file
    class_name   = "#{extname( file )[1..-1].capitalize}Parser"
    parser_class = Object.const_get( class_name )
    file_content = parser_class.new.read_file( file )
  end

  def self.paragraphs_of file
    content_of( file ).split(/\r/)
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
    Settings.supported_docs.include?( extname(f_name) )
  end    

end
