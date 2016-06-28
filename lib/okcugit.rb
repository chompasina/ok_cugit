
module OkCuGit
  class Finder
    attr_reader :repo_name

    def initialize(repo_name)
      @repo_name = repo_name
    end

    def all_contributors
      directory = repo_name.split('/').last
      Dir.chdir(directory)
      log = `git log`
      array = log.split("\n")
      # logic that ryan built will go here 
      # print log
    end
  end
end

repo_name = ARGV[0]
finder = OkCuGit::Finder.new(repo_name)
# print log
# contacts = finder.all_contributors
# puts contacts.join("\n")
