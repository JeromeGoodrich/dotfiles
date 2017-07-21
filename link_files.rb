#!/usr/bin/env ruby

require 'fileutils'

LINKS = {
  'vimrc' => '.vimrc',
  'tmux.conf' => '.tmux.conf',
  'gitconfig' => '.gitconfig'
}.freeze

working_dir = File.expand_path(File.dirname(__FILE__))
home_dir = File.expand_path('~')

LINKS.each do |existing, new|
  sym_link = File.join(working_dir, existing)
  dotfile = File.join(home_dir, new)

  FileUtils.rm(dotfile) if File.symlink?(dotfile) || File.exist?(dotfile)
  FileUtils.ln_s(sym_link, dotfile)
end
