# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  new_library = {}
  library = YAML.load_file(file_path).each do |emoji_name, emoji|
    new_library[emoji_name] = {}
    new_library[emoji_name][:english] = emoji[0]
    new_library[emoji_name][:japanese] = emoji[1]
  end
  new_library
end

def get_japanese_emoticon(file_path, emoticon)
  load_library(file_path).each do |emoji_name, emoji|
    if emoji[:english] == emoticon
      return emoji[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  load_library(file_path).each do |emoji_name, emoji|
    if emoji[:japanese] == emoticon
      return emoji_name
    end
  end
  "Sorry, that emoticon was not found"
end