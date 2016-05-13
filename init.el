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

(use-package cc-mode
  :defer t
  :config
  (progn
    (use-package google-c-style
      :ensure t
      :init
      (progn
	(add-hook 'c-mode-common-hook
		  (lambda ()
		    (google-set-c-style)
		    (google-make-newline-indent))))
      :config
      (c-set-offset 'statement-case-open 0))))

(use-package color-theme-sanityinc-solarized
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
  (progn
    (use-package helm-mode
      :diminish helm-mode
      :init (helm-mode 1))
    (global-unset-key (kbd "C-x c"))))

(use-package magit
  :ensure t
  :defer 5)

;;; init.el ends here
