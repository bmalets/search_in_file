require 'spec_helper'

describe "File Search System" do

  describe "Document Parsers Testing" do

    STRESS_COUNT.times do |number|

      it "Read TXT files test number #{number}" do
        tmp_path  = FIXTURE_PATH + '/basic.txt'
        data_read = TxtParser.new.read_file(tmp_path)
        data_read.include? 'Often needs to retrieve documents on its'
      end

      it "Read DOC files test number #{number}" do
        tmp_path  = FIXTURE_PATH + '/basic.doc'
        data_read = DocParser.new.read_file(tmp_path)
        data_read.include? 'Often needs to retrieve documents on its'
      end


      it "Read DOCX files test number #{number}" do
        tmp_path  = FIXTURE_PATH + '/basic.docx'
        data_read = DocxParser.new.read_file(tmp_path)
        data_read.include? 'Often needs to retrieve documents on its'
      end


      it "Read PDF files test number #{number}" do
        tmp_path  = FIXTURE_PATH + '/basic.pdf'
        data_read = PdfParser.new.read_file(tmp_path)
        data_read.include? 'Often needs to retrieve documents on its'
      end

    end       

  end
end