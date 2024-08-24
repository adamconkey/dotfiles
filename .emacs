
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
(straight-use-package 'exec-path-from-shell)
(straight-use-package 'vterm)
(straight-use-package 'doom-themes)
(straight-use-package 'windresize)
(straight-use-package 'cython-mode)
(straight-use-package 'yaml-mode)
(straight-use-package 'rust-mode)
(straight-use-package 'cmake-mode)

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
;; Auto-load files when they've changed on disk
(global-auto-revert-mode t)
;; Enable shift+errors for window navigation
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

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
(setq c-default-style "linux"
      c-basic-offset 4)
; Make .h files be C++ mode
(setq auto-mode-alist(cons '("\\.h$"   . c++-mode)  auto-mode-alist))


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

