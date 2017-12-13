;- turn off toolbar

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;- save your configure
;- define a function to quickly open your config file

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;;(require 'init-packages )
;;(require 'init-ui)
;;(require 'init-better-defaults)
;;(require 'init-keybindings)
;;(require 'init-org)

;;(load "init-packages" )                 
;;(load "init-ui")
;;(load "init-better-defaults")
;;(load "init-keybindings")
;;(load "init-org")

(load-file "~/.emacs.d/lisp/init-packages.elc")
(load-file "~/.emacs.d/lisp/init-ui.elc")
;;(load-file "~/.emacs.d/lisp/init-better-defaults.elc")
(load-file "~/.emacs.d/lisp/init-keybindings.elc")
(load-file "~/.emacs.d/lisp/init-org.elc")

(autoload 'test-autoload "init-better-defaults")

(test-autoload)


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

































