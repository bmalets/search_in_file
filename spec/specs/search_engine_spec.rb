require 'spec_helper'

describe "File Search System" do

  describe "Search engine tests" do

    10.times do |number|
      it "Search phrase in directory number #{number}" do

        dir_path  = File.expand_path('../..', __FILE__) + '/fixtures'
        term      = 'Often needs to retrieve documents on its'
        results   = SearchInFile.search( dir_path, term )

        results.class == 'Array'
        results.count == 9

        results.each do |result| 
          ['.doc', '.docx', '.pdf', '.txt'].include? File.extname(result[:file])
          File.exist?( result[:file] ).should == true 
          
          result[:paragraphs].each{ |paragraph| paragraph.include? term }
        end
      end
    end

  end
end