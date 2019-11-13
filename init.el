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

(when (eq system-type 'darwin)
  ;; default Latin font (e.g. Consolas)
  (set-face-attribute 'default nil :family "Monaco")
  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly.
  (set-face-attribute 'default nil :height 140))

;; Select theme
;; (if (daemonp)
;;     (add-hook 'after-make-frame-functions
;; 	      (lambda (frame)
;; 		(select-frame frame)
;; 		(load-theme 'tango-dark t)))
;;   (load-theme 'tango-dark t))

;; Re-enable disabled commands
(put 'narrow-to-region 'disabled nil)

;; Fix path on Mac
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(use-package tex
  :ensure auctex
  :hook ((tex-mode . auto-fill-mode)
         (tex-mode . outline-minor-mode)))

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

(use-package bison-mode
  :ensure t
  :mode (".y|.yy|.yc|.l"))

(use-package cmake-mode
  :ensure t
  :mode "CMakeLists.txt|.cmake")

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
  :hook (prog-mode . company-mode))

(use-package dockerfile-mode
  :ensure t
  :mode "^Dokerfile.*")

(use-package ibuffer-mode
  :bind ("C-x C-b" . ibuffer))

(use-package langtool
  :ensure t
  :bind
  (("C-x 4 w" . langtool-check)
   ("C-x 4 W" . langtool-check-done)
   ("C-x 4 4" . langtool-show-message-at-point)
   ("C-x 4 c" . langtool-correct-buffer)))

(use-package flycheck
  :ensure t
  :hook ((prog-mode . flycheck-mode)
         (tex-mode . flycheck-mode)))

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

(use-package markdown-mode
  :ensure t
  :mode ".md"
  :config
  (auto-fill-mode))

(use-package org
  :ensure t
  :bind
  (("C-c c" . org-capture)
   ("C-c a" . org-agenda))
  :config
  ;; (use-package ox-reveal :ensure t)
  (auto-fill-mode))

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets :ensure t)
  (yas-reload-all)
  :hook   (prog-mode . yas-minor-mode))

(use-package python
  :mode ("\\.py\\'|wscript" . python-mode)
  :interpreter ("python" . python-mode))

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :config (flycheck-mode))

(use-package pipenv
  :ensure t
  :defer t
  :hook (python-mode . pipenv-mode))

;;; init.el ends here
