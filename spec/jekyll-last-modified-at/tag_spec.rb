require 'spec_helper'

describe(Jekyll::LastModifiedAt::Tag) do
  let(:source) { @fixtures_path }
  let(:dest)   { source.join("_site") }
  let(:site)   { Site.new(Configuration::DEFAULTS.merge({
    "source" => source.to_s,
    "destination" => dest.to_s
  })) }
  subject { dest.join("file.txt").to_s }

  before(:each) do
    tz = ENV['TZ']
    ENV['TZ'] = 'America/New_York'
    site.process
    ENV['TZ'] = tz
  end

  it "understands happiness" do
    expect(File.read(subject)).to match(/19\-Jul\-14/)
  end
end
