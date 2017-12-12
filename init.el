;- turn off toolbar

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa-cn" . "http://elpa.emacs-china.org/melpa/") t)
  )
(require 'cl)

;;add whatever packages you want here

(defvar eyoumxu/packages '(
                           company
                           monokai-theme
                           hungry-delete
                           swiper
                           counsel
                           smartparens
                           js2-mode
                           nodejs-repl
                           exec-path-from-shell
                           popwin
                           ) "Default packages")
(setq package-selected-packages eyoumxu/packages)

(defun eyoumxu/packages-installed-p ()
  (loop for pkg in eyoumxu/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))


(unless (eyoumxu/packages-installed-p)
  (message "%s" "Refreshing package databases...")
  (package-refresh-contents)
  (dolist (pkg eyoumxu/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(require 'hungry-delete)
(global-hungry-delete-mode t)

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))




(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

(require 'popwin)
(popwin-mode t)
;; let emacs coudl found the execuable

(tool-bar-mode -1)
;;- turn off scroll-bar
(scroll-bar-mode -1)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                            ("8xym" "xuyouming")
                                            ("8ms" "Microsoft")
                                            ))
(require 'org)                          
(setq org-src-fontify-natively t)
;;- turn off splash screen
(setq inhibit-splash-screen t)

(setq-default cursor-type 'bar)


(setq make-backup-files nil)
(setq auto-save-default nil)

;;(require 'org)                          
;;(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-hl-line-mode t)
(delete-selection-mode t)
(load-theme 'monokai t)

(global-set-key (kbd  "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(setq initial-frame-alist (quote ((fullscreen . maximized))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(setq visible-bell t)
(setq inhibit-startup-message t)
(setq column-number-mode t)
(setq mouse-yank-at-point t)
(setq kill-ring-max 200)
(setq default-fill-column 60)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 8)

;; introduce common-lisp, so that loop can be used

(setq tab-stop-list ())
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x 4) tab-stop-list )))
 

(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)


(setq enable-recursive-minibuffers t)

(setq scroll-margin 3
      scroll-conservatively 10000)

;;(setq default-major-mode 'text-mode)    

(show-paren-mode t)
(setq show-paren-style 'parentheses)

(mouse-avoidance-mode 'animate)

(setq frame-title-format "emacs%b")

(auto-image-file-mode)

(global-font-lock-mode t)


(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

(mapcar
 (function (lambda (setting)
	     (setq auto-mode-alist
		   (cons setting auto-mode-alist))))
 '(("\\.xml$". sgml-mode)
   ("\\.bash". sh-mode)
   ("\\.rdf$" .sgml-mode)
   ("\\.session". emacs-lisp-mode)
   ("\\.l$". c-mode)
   ("\\.c\\'" . c-mode)
   ("\\.C\\'" . c++-mode)
   ("\\.cpp\\'" . c++-mode)
   ("\\.h\\'" . c-mode)
   ("\\.el\\'" . emacs-lisp-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("\\.html$" . html-mode)
   ("gnus" . emacs-list-mode)
   ("\\.idl$" . idl-mode)
   ("\\.js\\'" . js2-mode)
   ))


;- show linum-mode
(global-linum-mode t)


;- save your configure
;- define a function to quickly open your config file

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-company-mode t)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-minimum-prefix-length 1)
 '(company-tooltip-idle-delay 0.08)
 '(custom-safe-themes
   (quote
    ("8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" default))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "gray")))))
