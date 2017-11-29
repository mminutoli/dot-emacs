
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(company-clang-executable nil)
 '(custom-file "~/.emacs.d/settings.el")
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/Cellar/emacs/HEAD-71766a4/libexec/emacs/26.0.50/x86_64-apple-darwin16.7.0" "/usr/local/bin")))
 '(fill-column 80)
 '(flycheck-clang-language-standard "c++11")
 '(flycheck-clang-pedantic t)
 '(flycheck-clang-pedantic-errors t)
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
     ("" "tabu" nil))))
 '(org-outline-path-complete-in-steps nil)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 3))))
 '(org-todo-keywords (quote ((sequence "TODO(t)" "WAITING(w)" "DONE(d)"))))
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (auctex cmake-mode dockerfile-mode langtool org-mode ox-reveal yasnippet markdown-mode ledger-mode magit google-c-style helm flycheck company color-theme-sanityinc-solarized use-package)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh" nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
