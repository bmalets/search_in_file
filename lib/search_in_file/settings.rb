require 'rbconfig'

module Settings

  def self.supported_docs
    Gem.win_platform? ? ['.doc', '.docx', '.pdf', '.txt'] : ['.docx', '.pdf', '.txt']
  end

  def self.test_count
    1
  end

  def self.fixtures_path
    File.expand_path('../../..', __FILE__) + '/spec/fixtures'
  end

end