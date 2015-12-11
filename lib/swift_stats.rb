require 'pry'

class SwiftStats

  def self.take_out_the_trash(file_path)
    File.delete(file_path)
  end

  def self.read_file(file_path)
    File.read(file_path)
  end

  def self.sanitize_with_fire(string)
    string.downcase.gsub(/[^a-z0-9\s]/i, " ").split(" ").uniq
  end

  def self.get_unique_count(string)
    sanitize_with_fire(string).count
  end

end