require 'spec_helper'

describe "Folder Search System" do

  describe "Search in folder tests" do

    10.times do |number|
      it "Search TXT files test number #{number}" do
        tmp_path = File.expand_path('../..', __FILE__) + '/fixtures'
        files = SearchInFile.find_by_type_in( tmp_path, '.txt' )
        files.each{ |f| File.extname(f) == '.txt' }
        files.count.should == 2
      end
    end

    10.times do |number|
      it "Search PDF files test number #{number}" do
        tmp_path = File.expand_path('../..', __FILE__) + '/fixtures'
        files = SearchInFile.find_by_type_in( tmp_path, '.pdf' )
        files.each{ |f| File.extname(f) == '.pdf' }
        files.count.should == 3
      end
    end

    10.times do |number|
      it "Search DOC files test number #{number}" do
        tmp_path = File.expand_path('../..', __FILE__) + '/fixtures'
        files = SearchInFile.find_by_type_in( tmp_path, '.doc' )
        files.each{ |f| File.extname(f) == '.doc' }
        files.count.should == 3
      end
    end

    10.times do |number|
      it "Search DOCX files test number #{number}" do
        tmp_path = File.expand_path('../..', __FILE__) + '/fixtures'
        files = SearchInFile.find_by_type_in( tmp_path, '.docx' )
        files.each{ |f| File.extname(f) == '.docx' }
        files.count.should == 2
      end
    end       

  end
end