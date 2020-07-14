# frozen_string_literal: true

module Jekyll
  module LastModifiedDate
    require 'jekyll-last-modified-date/tag'
    require 'jekyll-last-modified-date/hook'

    autoload :VERSION, 'jekyll-last-modified-date/version'
    autoload :Executor, 'jekyll-last-modified-date/executor'
    autoload :Determinator, 'jekyll-last-modified-date/determinator'
    autoload :Git, 'jekyll-last-modified-date/git'

    PATH_CACHE = {} # rubocop:disable Style/MutableConstant
    REPO_CACHE = {} # rubocop:disable Style/MutableConstant
  end
end
