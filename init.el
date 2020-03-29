;; Package Management with use-package.el
(require 'package)
(package-initialize)

(eval-when-compile
  (require 'use-package))

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
	 
;; Don't litter directory with backups
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Get rid of Menu bar, tool bar ande scroll bar in GUI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Parens
(show-paren-mode 1)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package solarized
  :ensure solarized-theme
  :init
  (load-theme 'solarized-dark t))

(use-package counsel)

(use-package ivy
  :init
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :bind
  ("C-S" . 'swiper)
  ("M-x" . 'counsel-M-x)
  ("<f1> f" . 'counsel-describe-function)
  ("<f1> v" . 'counsel-describe-variable)
  ("<f1> l" . 'counsel-find-library)
  ("<f2> i" . 'counsel-info-lookup-symbol)
  ("<f2> u" . 'counsel-unicode-char))

  
(use-package emmet-mode
  :hook
  sgml-mode-hook
  css-mode-hook)

(use-package go-mode)
