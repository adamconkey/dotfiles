
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(tango-dark))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Install the Straight package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Packages installed using Straight
(straight-use-package 'helm)
(straight-use-package 'auctex)
(straight-use-package 'helm-bibtex)
(straight-use-package 'exec-path-from-shell)

;; Mainly for Mac
(exec-path-from-shell-initialize)
(setq default-directory "~/")

;; Helm config
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(setq helm-buffer-max-length nil)

;; Avoid mixing tabs/spaces
(setq-default indent-tabs-mode nil)

;; No toolbar, menubar, or scrollbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

;; C++
(defun my-c++-mode-hook ()
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; LaTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)
(setq TeX-view-program-list '(("Skim" "open -a Skim.app %o"))) ; use Skim on Mac
(setq TeX-view-program-selection '((output-pdf "Skim"))) ; use Skim on Mac
(setq-default fill-column 80) ; hard wrap at this many chars
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill) ; hard line wraps
(setq TeX-brace-indent-level 0) ; no indents e.g. footnote on hard line wrap
(setq LaTeX-item-indent 0) ; 2 spaces for \item (default -2)
; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)


;; Helm-bibtex
(require 'helm-bibtex)
(autoload 'helm-bibtex "helm-bibtex" "" t)
(global-set-key (kbd "C-c [") 'helm-bibtex-with-local-bibliography)
(setq bibtex-completion-cite-prompt-for-optional-arguments nil)
(helm-delete-action-from-source "Insert Citation" helm-source-bibtex)
(helm-add-action-to-source "Insert Citation"
                           'helm-bibtex-insert-citation
                            helm-source-bibtex 0)
