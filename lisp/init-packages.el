;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (>= emacs-major-version 24)
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
                           reveal-in-osx-finder
                           web-mode
                           js2-refactor
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

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)



;;let emacs could found the executable
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))




(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

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
   ("\\.cfm$" . web-mode)
   ("\\.html$" . web-mode)
   ("gnus" . emacs-list-mode)
   ("\\.idl$" . idl-mode)
   ("\\.js\\'" . js2-mode)
   ))

(global-company-mode t)

;;basic indentation for web-mode
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; switch identation length between 2 and 4
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;;add-hool for js2mode-hook
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")
(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

(provide  'init-packages)
