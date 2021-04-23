
(package-initialize)

(custom-set-variables
 '(custom-enabled-themes (quote (misterioso)))
 '(inhibit-startup-screen t))
(custom-set-faces
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
;(straight-use-package 'latex-preview-pane)
(straight-use-package 'exec-path-from-shell)

;; Mainly for Mac
(exec-path-from-shell-initialize)

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
;; Set latex viewer for Mac
(setq TeX-view-program-list '(("Skim" "open -a Skim.app %o")))
(setq TeX-view-program-selection '((output-pdf "Skim")))
(setq fill-column 80)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

