require_relative '../lib/swift_stats'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class SwiftStatsTest < Minitest::Test

  def test_reads_in_file
    lyrics = SwiftStats.read_file("lyrics.txt")
    assert lyrics
  end

  def test_downcases_string
    test_lyrics = "More Like FAILER Swift"

    assert_equal ["more", "like", "failer", "swift"], SwiftStats.sanitize_with_fire(test_lyrics)
  end

  def test_removes_punctuation
    test_lyrics = "a,b!#$&';:()?.,-o/p"

    assert_equal ["a", "b", "o", "p"], SwiftStats.sanitize_with_fire(test_lyrics)
  end

  def test_removes_duplicates
    test_lyrics = "a A the tHe dog DOGMA"

    assert_equal ["a", "the", "dog", "dogma"], SwiftStats.sanitize_with_fire(test_lyrics)
  end

  def test_returns_unique_word_count
    test_lyrics = "a A-the&THE,fIrE!fire.?"
    trash_lyrics = SwiftStats.read_file("lyrics.txt")

    assert_equal 3, SwiftStats.get_unique_count(test_lyrics)
    assert_equal 1950, SwiftStats.get_unique_count(trash_lyrics)
  end

end