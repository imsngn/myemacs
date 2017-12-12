;- show linum-mode
(global-linum-mode t)

(setq scroll-margin 3
      scroll-conservatively 10000)

(global-hl-line-mode t)

;; close the noisy voice
(setq visible-bell t)
;; close the startup wiindows
(setq inhibit-startup-message t)
;; enable the column number
(setq column-number-mode t)

;; to insert the yankk content at the mouse bar
(setq mouse-yank-at-point t)

;; to set big ring 
(setq kill-ring-max 200)
;; set the cllumn length to be 60
(setq default-fill-column 60)

;; not to use TAB as be indent
(setq-default indent-tabs-mode nil)
(setq default-tab-width 8)
(setq tab-stop-list ())
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x 4) tab-stop-list )))
 
;;be able to recongonize the chinese punctions
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; re-eanble the disabled-default features
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;;be able to use the minibuffer recursively
(setq enable-recursive-minibuffers t)



(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

;;(setq default-major-mode 'text-mode)    


;; to automatically display the other bracket 
(show-paren-mode t)
(setq show-paren-style 'parentheses)


;; when the mouse clear to the bar, then the bar jump away
(mouse-avoidance-mode 'animate)

;;display the name of buffer on title
(setq frame-title-format "emacs%b")

;;be able to directly open the image file
(auto-image-file-mode)

;; syntax color on
(global-font-lock-mode t)
;; useful info
(setq user-full-name "xuyouming")
(setq user-mail-address "wcdma@live.cn")

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                            ("8xym" "xuyouming")
                                            ("8ms" "Microsoft")
                                            ))

;;be able to delete or copy recursively directory 
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
(setq make-backup-files nil)
(setq auto-save-default nil)


(global-auto-revert-mode t)

(recentf-mode 1)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(delete-selection-mode t)
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
(provide 'init-better-defaults)
