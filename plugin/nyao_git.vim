fu! s:setup()
ruby << RUBY
module Git
  def self.method_missing(method, *args, &block) = `git #{method} #{args.join(' ')}`.split("\n")
  def self.[](expr) = `git #{expr}`.split("\n")
end

doc_path = Ev.expand('<sfile>:h:h') + 'doc/'
Ex['silent! exe "helptags '+doc_path+'"']
RUBY
endfu

call s:setup()

if exists('g:nyao_always_add_mappings') && g:nyao_always_add_mappings
endif

