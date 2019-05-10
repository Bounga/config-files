if ENV['INSIDE_EMACS']
  Pry.config.correct_indent = false
  Pry.config.pager = false
end

if defined?(Rails::ConsoleMethods)
  include Rails::ConsoleMethods
end

Pry.config.editor = ENV['EDITOR']
