require_relative "./skinnytaste_recipes/version"
require_relative "./skinnytaste_recipes/cli"
require_relative "./skinnytaste_recipes/scraper"
require_relative "./skinnytaste_recipes/category"

require 'pry'
require 'nokogiri'
require 'open-uri'

module SkinnytasteRecipes
  class Error < StandardError; end
  # Your code goes here...
end
