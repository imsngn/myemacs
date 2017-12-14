
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;- save your configure
;- define a function to quickly open your config file

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(require 'init-packages )
(require 'init-font-setting)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)

;;(load "init-packages" )                 
;;(load "init-ui")
;;(load "init-better-defaults")
;;(load "init-keybindings")
;;(load "init-org")

;;(load-file "~/.emacs.d/lisp/init-packages.elc")
;;(load-file "~/.emacs.d/lisp/init-ui.elc")
;;(load-file "~/.emacs.d/lisp/init-better-defaults.elc")
;;(load-file "~/.emacs.d/lisp/init-keybindings.elc")
;;(load-file "~/.emacs.d/lisp/init-org.elc");;(autoload 'test-autoload "init-better-defaults")

;;(test-autoload)


;;(update-file-autoloads "~/.emacs.d/lisp/init-better-defaults.el" t "~/.emacs.d/lisp/init-better-defaults-autoload.el")

;;(load "init-better-defaults-autoload")

;;(test-autoload-via-magic)


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
