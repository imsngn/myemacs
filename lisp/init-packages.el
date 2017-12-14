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


;;show-paren-mode 可以使鼠标在括号上是高亮其所匹配的另一半括号，然而我们想要光标 在括号内时就高亮包含内容的两个括号，使用下面的代码就可以做到这一点。

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))


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
   ("\\.cfm$" . html-mode)
   ("\\.html$" . html-mode)
   ("gnus" . emacs-list-mode)
   ("\\.idl$" . idl-mode)
   ("\\.js\\'" . js2-mode)
   ))

(global-company-mode t)

(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

(provide  'init-packages)
