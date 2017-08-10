;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    material-theme
    exec-path-from-shell
    cython-mode
    auctex
    reftex
    projectile
    helm-projectile
    company
    company-jedi
    pandoc-mode
    markdown-mode
    multiple-cursors
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

;; PYTHON CONFIGURATION
;; --------------------------------------

;;; add path to python (need package as loaded above)
(exec-path-from-shell-copy-env "PATH")
(elpy-enable)
(elpy-use-ipython)

;JEDI for python and elpy
(setq elpy-rpc-backend "jedi")  
;(setq jedi:complete-on-dot t)                 ; optional

;; COMPANY (http://people.duke.edu/~aql3/emacs-there-and-back-again/)
 (defun my/python-mode-hook ()
 (add-to-list 'company-backends 'company-jedi))
 (add-hook 'python-mode-hook 'my/python-mode-hook)
 ;; Enable company mode everywhere
 (add-hook 'after-init-hook 'global-company-mode)
 ;; Set up TAB to manually trigger autocomplete menu
 (define-key company-mode-map (kbd "TAB") 'company-complete)
 (define-key company-active-map (kbd "TAB") 'company-complete-common)
 ;; Set up M-h to see the documentation for items on the autocomplete menu
 (define-key company-active-map (kbd "M-h") 'company-show-doc-buffer)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;;CYTHON MODE
(require 'cython-mode)

;;marking text outside emacs
;;from: http://www.aaronbedra.com/emacs.d/#environment
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;;IDO (better file management)
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

;;
;;recent files
;;
(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; REFTEX AND AUCTEX
;;RefTex
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'reftex-mode)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'reftex-mode)   ; with Emacs latex mode
;; Math mode for LaTex
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;;set tex-symbol-complete
(add-hook 'LaTeX-mode-hook
      (lambda()
        (local-set-key [C-tab] 'TeX-complete-symbol)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list (quote (("Okular" "okular -unique %o#src:%n%b"))))
 '(TeX-view-program-selection (quote ((output-pdf "Okular") (engine-omega "dvips and gv") (output-dvi "xdvi") (output-pdf "xpdf") (output-html "xdg-open"))))
 '(browse-url-browser-function (quote browse-url-firefox))
 '(browse-url-firefox-new-window-is-tab t)
 '(browse-url-generic-program "\"firefox\"") )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; projectile (nicer file browsing)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)

(helm-projectile-on)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;;;;;;;;;
; Set up MARKDOWN in Emacs
; Tutorial: http://jblevins.org/projects/markdown-mode/
  (add-hook 'markdown-mode-hook 'pandoc-mode)

(add-hook 'text-mode-hook (lambda() (flyspell-mode 1)))
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
;;;;;;;;;;;;;;;;;;;;

;;
;;ORG mode
;;
(setq org-log-done t
      org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))
;;;;;;;;;;;;;;

;;;;;;MULTIPLE CURSORS
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)


;; init.el ends here

