(require 'markdown-mode)

(add-to-list 'auto-mode-alist
             '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\|mdx\\)\\'" . markdown-mode))

(provide 'init-markdown)
