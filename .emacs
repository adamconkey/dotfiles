
(package-initialize)


;; STRAIGHT PACKAGE MANAGEMENT ============================================================

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
(straight-use-package 'vterm)
(straight-use-package 'doom-themes)
(straight-use-package 'windresize)
(straight-use-package 'cython-mode)
;; (straight-use-package 'magit)
(straight-use-package 'yaml-mode)
(straight-use-package 'org-bullets)

;; END STRAIGHT PACKAGE MANAGEMENT =======================================================



;; MACROS ================================================================================

;; with-system: check OS to apply different settings (gnu/linux, darwin)
;;   https://stackoverflow.com/a/26137517/3711266
(defmacro with-system (type &rest body)
  "Evaluate BODY if `system-type' equals TYPE."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))

;; END MACROS ============================================================================



;; Appearance
(load-theme 'doom-gruvbox t)
(tool-bar-mode -1)
(menu-bar-mode -1)
;; (toggle-scroll-bar -1)


;; General setup
(setq inhibit-startup-screen t)


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
(with-system darwin
  ;; use Skim on Mac
  (setq TeX-view-program-list '(("Skim" "open -a Skim.app %o")))
  (setq TeX-view-program-selection '((output-pdf "Skim"))))
(setq-default fill-column 80) ; hard wrap at this many chars
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill) ; hard line wraps
(setq TeX-brace-indent-level 0) ; no indents e.g. footnote on hard line wrap
(setq LaTeX-item-indent 0) ; 2 spaces for \item (default -2)
;; auto-replace $.$ math env with \(.\)
(add-hook 'LaTeX-mode-hook
          (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
                          (cons "\\(" "\\)"))))

;; Helm-bibtex
(require 'helm-bibtex)
(autoload 'helm-bibtex "helm-bibtex" "" t)
(global-set-key (kbd "C-c [") 'helm-bibtex-with-local-bibliography)
(setq bibtex-completion-cite-prompt-for-optional-arguments nil)
(helm-delete-action-from-source "Insert Citation" helm-source-bibtex)
(helm-add-action-to-source "Insert Citation"
                           'helm-bibtex-insert-citation
                            helm-source-bibtex 0)


;; vterm
(defun vterm-named (term-name)
  "Generate a terminal with buffer name TERM-NAME."
  (interactive "sTerminal name: ")
  (vterm (concat "vterm-" term-name)))

(defun dev-mode ()
  (interactive)
  (split-window-right 100)
  (other-window 1)
  (vterm))


;; This was necessary to avoid a helm error on glados:
;;     https://emacs.stackexchange.com/questions/65069/helm-installing-issues
(setq while-no-input-ignore-events '())


(with-system darwin
  ;; Avoids getting lots of warnings/errors when install emacs --with-native-comp
  (setq native-comp-async-report-warnings-errors nil))


;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a time


;; org mode
(add-hook 'org-mode-hook 'org-bullets-mode)
(setq org-startup-indented t)
(setq org-todo-keywords '((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d)")))
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "IndianRed" :weight bold))
        ("STARTED" . (:foreground "LimeGreen" :weight bold))
        ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/multisensory_learning_paper/plan.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
