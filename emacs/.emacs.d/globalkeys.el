;;; package --- summary
;;; Commentary:
;;; Code:
(require 'helm)
(require 'helm-files)
(require 'helm-command)
(global-unset-key (kbd "\C-f"))
(local-unset-key (kbd "\C-f"))
(define-prefix-command 'custom-map)
(global-set-key (kbd "<C-return>") 'custom-map)
(defun goconfig (conf-file)
  "Go to main configuration CONF-FILE as input file."
  (interactive)
  (defvar a-base "~/.emacs.d/")
  (if (equal ".emacs" conf-file)
      (find-file (concat a-base conf-file))
    (find-file (concat a-base ".emacs.d/" conf-file))))
    
(define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
(define-key helm-map (kbd "C-h") #'helm-find-files-up-one-level)

(add-hook 'helm-after-initialize-hook
	  (lambda()
	    (define-key helm-buffer-map (kbd "ESC") 'helm-keyboard-quit)
	    (define-key helm-M-x-map (kbd "ESC") 'helm-keyboard-quit)
	    (define-key helm-map (kbd "ESC") 'helm-keyboard-quit)
	    (define-key helm-find-files-map (kbd "ESC") 'helm-keyboard-quit)))

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(define-key 'custom-map (kbd "c m") (defun main () (interactive) (goconfig ".emacs")))
(define-key 'custom-map (kbd "c g") (defun globalkeys() (interactive) (goconfig "globalkeys.el")))
(define-key 'custom-map (kbd "l C-p p") (defun cppconfig() (interactive) (goconfig "c++config.el")))
(define-key 'custom-map (kbd "c c") (defun configs() (interactive) (helm-find-files-1 "~/.emacs.d/")))
(define-key 'custom-map (kbd "p") (defun projects() (interactive) (helm-find-files-1 "~/projects/")))
;;(define-key 'custom-map (kbd "c e") 'goconfig)
;;; globalkeys.el ends here
