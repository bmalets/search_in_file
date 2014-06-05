require 'spec_helper'

describe "File Search System" do

  describe "Document Parsers Testing" do

    10.times do |number|
      it "Read TXT files test number #{number}" do
        tmp_path  = File.expand_path('../..', __FILE__) + '/fixtures/basic.txt'
        data_read = TxtParser.new.read_file(tmp_path)
        data_read.include? 'Often needs to retrieve documents on its'
      end
    end

    10.times do |number|
      it "Read DOC files test number #{number}" do
        tmp_path  = File.expand_path('../..', __FILE__) + '/fixtures/basic.doc'
        data_read = DocParser.new.read_file(tmp_path)
        data_read.include? 'Often needs to retrieve documents on its'
      end
    end

    10.times do |number|
      it "Read DOCX files test number #{number}" do
        tmp_path  = File.expand_path('../..', __FILE__) + '/fixtures/basic.docx'
        data_read = DocxParser.new.read_file(tmp_path)
        data_read.include? 'Often needs to retrieve documents on its'
      end
    end  

    10.times do |number|
      it "Read PDF files test number #{number}" do
        tmp_path  = File.expand_path('../..', __FILE__) + '/fixtures/basic.pdf'
        data_read = PdfParser.new.read_file(tmp_path)
        data_read.include? 'Often needs to retrieve documents on its'
      end
    end       

  end
end