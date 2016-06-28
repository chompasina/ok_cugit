require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/okcugit'

class FinderTest < Minitest::Test

  def test_that_finder_exists_with_repo_name
    repo = OkCuGit::Finder.new("challenges")

    assert_equal "challenges", repo.repo_name
  end




end
