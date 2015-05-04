require 'minitest/autorun'
require 'minitest/pride'
require './lib/finder'
require 'open3'

class OkcugitTest < Minitest::Test
  attr_reader :finder

  def setup
    @finder = Finder.new('turingschool/challenges')
  end

  def test_it_has_a_repo
    assert_equal 'turingschool/challenges', finder.repo_name
  end

  def test_it_makes_a_temp_folder
    finder.create_temp_folder
    stdout, stderr, status = Open3.capture3(
      'cd ~/temp_okcugit_repos'
    )
    assert_equal '', stdout
    assert_equal '', stderr
    assert status.success?
  end

  def test_it_can_clone_the_repo
    finder.create_temp_folder
    finder.change_directory_to_temp
    finder.clone_repo_in_temp_folder
    dir = '~/temp_okcugit_repos'
    assert_equal 1, Dir[File.join(dir, '**', '*')].count { |file| File.file?(file) }
  end
end
