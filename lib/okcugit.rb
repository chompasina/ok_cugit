module OkCuGit
  class Finder
    attr_reader :user_and_repo,
                :repo_name

    def initialize(user_and_repo)
      @user_and_repo = user_and_repo
      @repo_name = user_and_repo.split("/")[1]
    end

    def clone_repo
      Dir.chdir("lib")
      `git clone https://github.com/"#{user_and_repo}"`
      Dir.chdir(repo_name)
    end

    def all_contributors
      log = `git log`
      all_authors_and_emails = log.split("\n").select do |line|
        line.include?("<")
      end.map { |line| line[8..-1] }

      unique_authors = all_authors_and_emails.map do |line|
        if line[0].downcase == line[0]
          author = line.split(" ")
        else
          author = line.downcase.split(" ").map {|name| name.capitalize}
        end
        author.join(" ")
      end.uniq.sort_by { |name| name[0].downcase }
    end

    def clean_up
      Dir.chdir('..')
      `rm -rf #{repo_name}`
    end
  end
end

if __FILE__ == $0
  user_and_repo = ARGV[0]
  finder = OkCuGit::Finder.new(user_and_repo)
  finder.clone_repo
  puts finder.all_contributors
  finder.clean_up
end
