    #find repo on github by repo_name
class Finder
  attr_reader :repo_name

  def initialize(repo_name)
    @repo_name = repo_name
  end

  def create_temp_folder
    `mkdir ~/temp_okcugit_repos`
  end

  def change_directory_to_temp
    `cd ~/temp_okcugit_repos`
  end

  def clone_repo_in_temp_folder
    `git clone https://github.com/#{repo_name}.git`
  end

  def all_contributors
    #returns an array of contributors to the repo
  end
end
