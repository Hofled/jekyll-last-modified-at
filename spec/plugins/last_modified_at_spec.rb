require "spec_helper"

describe "Last Modified At Tag" do
  context "A Post file" do
    before(:all) do
      file = "1984-03-06-last-modified-at.md"
      @post = setup_post(file)
      do_render(@post, "last_modified_at.html")
    end

    it "has last revised date" do
      expect(@post.output).to match /Article last updated on 03-Jan-14/
    end
  end
  
  context "An uncommitted post file" do
    before(:all) do
      cheater_file = "1984-03-06-last-modified-at.md"
      uncommitted_file = "1992-09-11-last-modified-at.md"
      File.open(uncommitted_file, "w") { |f| f.puts(File.read(cheater_file)) }
      @post = setup_post(uncommitted_file)
      do_render(@post, "last_modified_at_uncommitted.html")
    end

    it "has last revised date" do
      expect(@post.output).to match Regexp.new("Article last updated on #{Time.new.strftime('%d-%b-%y')}"
    end
  end
end
