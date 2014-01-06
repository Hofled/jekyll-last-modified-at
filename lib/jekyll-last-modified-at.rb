module Jekyll
  class LastModifiedAtTag < Liquid::Tag
    def initialize(tag_name, format, tokens)
      super
      @format = format.empty? ? nil : format.strip
    end

    def render(context)
      article_file = context.environments.first["page"]["path"]
      article_file_path = File.expand_path(article_file, context.registers[:site].source)

      if is_git_repo?
        top_level_git_directory = File.join(`git rev-parse --show-toplevel`.strip, ".git")
        last_commit_date = `git --git-dir #{top_level_git_directory} log --format="%ct" -- #{article_file_path}`.strip
        last_modified_time = !last_commit_date.empty? ? last_commit_date : mtime(article_file_path)
      else
        last_modified_time = mtime(article_file_path)
      end

      Time.at(last_modified_time.to_i).strftime(@format || "%d-%b-%y")
    end

    def is_git_repo?
      `git rev-parse --is-inside-work-tree`.strip == "true"
    rescue
      false
    end

    def mtime(file)
      File.mtime(file)
    end
  end
end

Liquid::Template.register_tag('last_modified_at', Jekyll::LastModifiedAtTag)
