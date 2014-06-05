require 'spec_helper'

describe "File Search System" do

  describe "Search engine tests" do

    STRESS_COUNT.times do |number|

      it "Search phrase in directory or in file number #{number}" do
        dir_path  = FIXTURE_PATH
        term      = 'Often needs to retrieve documents on its'
        results   = SearchInFile.search( dir_path, term )

        expect(results.class).to eq(Array)
        expect(results.count).to eq(7)

        results.each do |result|
          SearchInFile.supported_documents.include? File.extname(result[:file])
          File.exist?( result[:file] ).should be(true)
          result[:paragraphs].each{ |paragraph| expect( paragraph.include?(term) ).to be true }
        end

      end

      it "Search phrase in directory number #{number}" do
        dir_path  = FIXTURE_PATH
        term      = 'Often needs to retrieve documents on its'
        results   = SearchInFile.search_in_directory( dir_path, term )

        expect(results.class).to eq(Array)
        expect(results.count).to eq(7)

        results.each do |result|
          SearchInFile.supported_documents.include? File.extname(result[:file])
          File.exist?( result[:file] ).should be(true)
          result[:paragraphs].each{ |paragraph| expect( paragraph.include?(term) ).to be true }
        end

      end

      SearchInFile.supported_documents.each do |f_type|
        it "Search phrase in #{f_type} file number #{number}" do
          f_path    = FIXTURE_PATH + "/basic#{f_type}"
          term      = 'Often needs to retrieve documents on its'
          results   = SearchInFile.search_in_file( f_path, term )

          expect(results.class).to eq(Array)
          results.each do |result| 
            SearchInFile.supported_documents.include? File.extname(result[:file])
            expect( File.exist?( result[:file] ) ).to be true
            result[:paragraphs].each{ |paragraph| paragraph.include? term }
          end
        end
      end

    end

  end
end