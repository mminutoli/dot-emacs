;;; init.el --- Entry point of my Emacs configuration.

;;; Commentary:
;; This file is the entry point of my Emacs configuration.

;;; Code:
(require 'package)

;; Avoid multiple initialization of installed packages.
(setq package-enable-at-startup nil)
;; Add Melpa to the list of package archives.
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; Do package initiazation.
(package-initialize)

;; Install use-package.  It is the only one explicitly installed, all the others
;; are automatically installed using the :ensure property of use-package.
(unless
    (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; Load customization settings.
(load (expand-file-name "settings" user-emacs-directory))

;; Select theme
(if (daemonp)
    (add-hook 'after-make-frame-functions
	      (lambda (frame)
		(select-frame frame)
		(load-theme 'tango-dark t)))
  (load-theme 'tango-dark t))

(use-package cc-mode
  :defer t
  :config
  (use-package google-c-style
    :ensure t
    :init
    (add-hook 'c-mode-common-hook
	      (lambda ()
		(google-set-c-style)
		(google-make-newline-indent)))
    :config
    (c-set-offset 'statement-case-open 0)))

(use-package color-theme-sanityinc-solarized
  :disabled t
  :ensure t
  :config
  (if (daemonp)
      (add-hook 'after-make-frame-functions
		(lambda (frame)
		  (select-frame frame)
		  (load-theme 'sanityinc-solarized-light t)))
    (load-theme 'sanityinc-solarized-light t)))

(use-package company
  :ensure t
  :defer 5
  :config (global-company-mode 1))

(use-package dockerfile-mode
  :ensure t
  :mode "^Dokerfile.*")

(use-package langtool
  :ensure t
  :bind
  (("C-x 4 w" . langtool-check)
   ("C-x 4 W" . langtool-check-done)
   ("C-x 4 4" . langtool-show-message-at-point)
   ("C-x 4 c" . langtool-correct-buffer)))

(use-package flycheck
  :ensure t
  :defer 5
  :config (global-flycheck-mode 1))

(use-package helm
  :ensure t
  :bind (("C-c h" . helm-command-prefix)
         ("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini))
  :config
  (use-package helm-mode
    :diminish helm-mode
    :init (helm-mode 1))
  (global-unset-key (kbd "C-x c")))

(use-package ledger-mode
  :ensure t
  :mode ".ldg")

(use-package magit
  :ensure t
  :defer 5)

(use-package org
  :ensure t
  :config
  (use-package ox-reveal :ensure t))

;;; init.el ends here
