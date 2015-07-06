# SearchInFile [![Gem Version](https://badge.fury.io/rb/search_in_file.svg)](http://badge.fury.io/rb/search_in_file) [![Code Climate](https://codeclimate.com/github/bmalets/search_in_file/badges/gpa.svg)](https://codeclimate.com/github/bmalets/search_in_file)

Search files with phrase by directory path.

## Installation

Add this line to your application's Gemfile:

    gem 'search_in_file'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install search_in_file

## Usage

To search some document with specified phrase in your file system just use:

	SearchInFile.search( directory_or_file_path, search_phrase )

P.S:       
  - Windows: gem supports searching in all .doc, .docx, .pdf and .txt files 
  - OS_X or Linux: gem supports searching in .docx, .pdf and .txt files

To be continued...

## Contributing

1. Fork it ( http://github.com/bmalets/search_in_file/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
