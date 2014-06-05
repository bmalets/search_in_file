require 'spec_helper'

describe "File Search System" do

  describe "Document Parsers Testing" do

    Settings.test_count.times do |number|

      it "Read TXT files test number #{number}" do
        tmp_path  = Settings.fixtures_path + '/basic.txt'
        data_read = TxtParser.new.read_file(tmp_path)
        data_read.include? 'Often needs to retrieve documents on its'
      end


      it "Read DOC files test number #{number}" do
        tmp_path  = Settings.fixtures_path + '/basic.doc'
        data_read = DocParser.new.read_file(tmp_path)
        data_read.include? 'Often needs to retrieve documents on its'
      end if Gem.win_platform?


      it "Read DOCX files test number #{number}" do
        tmp_path  = Settings.fixtures_path + '/basic.docx'
        data_read = DocxParser.new.read_file(tmp_path)
        data_read.include? 'Often needs to retrieve documents on its'
      end


      it "Read PDF files test number #{number}" do
        tmp_path  = Settings.fixtures_path + '/basic.pdf'
        data_read = PdfParser.new.read_file(tmp_path)
        data_read.include? 'Often needs to retrieve documents on its'
      end

    end       

  end
end