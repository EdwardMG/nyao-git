fu! s:setup()
ruby << RUBY
module Git
  def self.method_missing(method, *args, &block)
    r = `git #{method} #{args.join(' ')}`.split("\n")
    Ex.redraw!
    r
  end
  def self.[](expr)
    r = `git #{expr}`.split("\n")
    Ex.redraw!
    r
  end
end

doc_path = Ev.expand('<sfile>:h:h') + 'doc/'
Ex['silent! exe "helptags '+doc_path+'"']
RUBY
endfu

call s:setup()

if exists('g:nyao_always_add_mappings') && g:nyao_always_add_mappings
endif

" Git.help '-a'
" Git.blame Ev.expand('%')
