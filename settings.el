
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-auto-save t)
 '(TeX-command-list
   (quote
    (("LaTeXmk" "latexmk -pdf %t" TeX-run-command nil
      (latex-mode))
     ("TeX" "%(PDF)%(tex) %(file-line-error) %`%(extraopts) %S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %T" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %`%(extraopts) %S%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t t :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil t :help "Convert DVI file to PostScript")
     ("Dvipdfmx" "dvipdfmx %d" TeX-run-dvipdfmx nil t :help "Convert DVI file to PDF with dvipdfmx")
     ("Ps2pdf" "ps2pdf %f" TeX-run-ps2pdf nil t :help "Convert PostScript file to PDF")
     ("Glossaries" "makeglossaries %s" TeX-run-command nil t :help "Run makeglossaries to create glossary file")
     ("Index" "makeindex %s" TeX-run-index nil t :help "Run makeindex to create index file")
     ("upMendex" "upmendex %s" TeX-run-index t t :help "Run upmendex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(TeX-parse-self t)
 '(TeX-shell "/bin/sh")
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(company-clang-arguments
   (quote
    ("-isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk")))
 '(company-clang-executable nil)
 '(custom-enabled-themes (quote (leuven)))
 '(custom-file "~/.emacs.d/settings.el")
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/Cellar/emacs/HEAD-71766a4/libexec/emacs/26.0.50/x86_64-apple-darwin16.7.0" "/usr/local/bin" "/Users/minu455/Library/Python/3.7/bin")))
 '(fill-column 80)
 '(flycheck-clang-args
   (quote
    ("-isysroot" "/Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk")))
 '(flycheck-clang-language-standard "c++14")
 '(flycheck-clang-pedantic t)
 '(flycheck-clang-pedantic-errors t)
 '(flycheck-global-modes nil)
 '(global-flycheck-mode t)
 '(helm-org-format-outline-path t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(langtool-default-language "en-US")
 '(langtool-language-tool-jar "~/tools/LanguageTool/languagetool-commandline.jar")
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/org/")))
 '(org-babel-load-languages
   (quote
    ((emacs-lisp . t)
     (awk . t)
     (dot . t)
     (python . t)
     (ledger . t))))
 '(org-capture-templates
   (quote
    (("t" "TODO [inbox]" entry
      (file+headline "~/org/inbox.org" "Tasks")
      "* TODO %i%? %^G")
     ("a" "Appointment/Meeting" entry
      (file+headline "~/org/inbox.org" "Appointments and Meetings")
      "* %i%?\\n %U"))))
 '(org-default-notes-file "~/org/refile.org")
 '(org-directory "~/org/")
 '(org-export-backends (quote (ascii beamer html icalendar latex)))
 '(org-latex-default-packages-alist
   (quote
    (("AUTO" "inputenc" t)
     ("T1" "fontenc" t)
     ("" "fixltx2e" nil)
     ("" "graphicx" t)
     ("" "grffile" t)
     ("" "longtable" nil)
     ("" "wrapfig" nil)
     ("" "rotating" nil)
     ("normalem" "ulem" t)
     ("" "amsmath" t)
     ("" "textcomp" t)
     ("" "amssymb" t)
     ("" "capt-of" nil)
     ("" "hyperref" nil)
     ("" "tabu" nil)
     ("" "listings" nil))))
 '(org-latex-listings t)
 '(org-outline-path-complete-in-steps nil)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 3))))
 '(org-todo-keywords (quote ((sequence "TODO(t)" "WAITING(w)" "DONE(d)"))))
 '(outline-minor-mode-prefix " ")
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (pipenv elpy powerline pdf-tools pdf-view exec-path-from-shell yasnippet-snippets bison-mode auctex cmake-mode dockerfile-mode langtool org-mode ox-reveal yasnippet markdown-mode ledger-mode magit google-c-style helm flycheck company color-theme-sanityinc-solarized use-package)))
 '(preview-TeX-style-dir "/Users/minu455/.emacs.d/elpa/auctex-12.1.2/latex" t)
 '(scroll-bar-mode nil)
 '(shell-file-name "/bin/zsh")
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh" nil (tramp))
 '(tramp-syntax (quote default) nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
