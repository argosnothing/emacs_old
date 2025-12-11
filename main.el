

(require 'package)
;;; Code:
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

(setq initial-buffer-choice "~/.emacs.d/.home.org")

(setq ring-bell-function 'ignore)

(require 'flycheck)
(require 'ox-twbs)
(require 'which-key)

(require 'evil)
(evil-mode 1)

(require 'company)
(company-mode 1)

(use-package company
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (setq company-idle-delay 0)))

(use-package org
  :config
  (progn
    (setq org-src-window-setup 'current-window)
    (setq org-src-fontify-natively t)
    (setq org-link-frame-setup '((file . find-file)))
    (setq org-confirm-babel-evaluate nil)
    (setq org-confirm-elisp-link-function nil)
    (setq vc-follow-symlinks nil))
  :defer t
  :config
  (bind-key "C-c a t" 'org-todo-list org-mode-map))



(use-package flycheck
  :config
  (progn
    (global-flycheck-mode)))

(require 'flycheck)
(defun disable-flycheck-in-org-src-block ()
  (setq-local flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
(add-hook 'org-src-mode-hook 'disable-flycheck-in-org-src-block)

(which-key-mode 1)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook #'irony-eldoc)

;(require 'exwm)
;(require 'exwm-config)
;(fringe-mode 1)
;(server-start)
;
;(setq exwm-workspace-number 4)
;
;(add-hook 'exwm-update-class-hook
	  ;(lambda ()
	    ;(exwm-workspace-rename-buffer exwm-class-name)))
;(add-hook 'exwm-update-title-hook
	  ;(lambda ()
	    ;(when (or (not exwm-instance-name)
		      ;(string-prefix-p "sun-awt-X11-" exwm-instance-name)
		      ;(string= "gimp" exwm-instance-name))
	      ;(exwm-workspace-rename-buffer exwm-title))))
;
;(setq exwm-input-global-keys
      ;`(
	;([?\s-r] . exwm-reset)
	;([?\s-q] . delete-window)
	;([?\s-/] . (lambda ()
		     ;(interactive)
		     ;(progn
		       ;(split-window-right)
		       ;(windmove-right)
		       ;(helm-buffers-list))))
	;([?\s--] . (lambda ()
		     ;(interactive)
		     ;(progn
		       ;(split-window-below)
		       ;(windmove-down)
		       ;(helm-buffers-list))))
	;([?\s-w] . exwm-workspace-switch)
	;([?\s-s] . (lambda (command)
		     ;(interactive (list (read-shell-command "$ ")))
		     ;(start-process-shell-command command nil command)))))
;(exwm-enable)

;(use-package helm
  ;:config
  ;(progn
    ;(setq helm-display-function 'helm-display-buffer-in-own-frame
	  ;helm-display-buffer-reuse-frame t
	  ;helm-use-undecorated-frame-option t)))

(require 'projectile)
(require 'helm)
(require 'evil)
(defun ends-with? (str containing)
  "Code: Sees if CONTAINING is at the end of STR."
  (interactive)
  (if (equal (substring str
			(- (length str)
			   (length containing))
		  (length str))
       containing)
      t
    nil))

(defun swap-ends (str from to)
  "Code: Swap the suffix of STR FROM to TO."
  (interactive)
  (if (ends-with? str from)
      (concat
       (substring str 0
		  (- (length str)
		     (length from)))
       to)
    nil))

(defun swap ()
  "Code: Jump from a header file to its implementation or vice-versa if they exist."
  (interactive)
  (cond ((ends-with? buffer-file-name ".cpp")
	 (if (file-exists-p (swap-ends buffer-file-name ".cpp" ".h"))
	     (find-file (swap-ends buffer-file-name ".cpp" ".h"))
	   (message "no header file")))
	((ends-with? buffer-file-name ".h")
	 (if (file-exists-p (swap-ends buffer-file-name ".h" ".cpp"))
	     (find-file (swap-ends buffer-file-name ".h" ".cpp"))
	   (message "no implementation file")))))

(add-hook 'c++-mode-hook
	  (lambda () (local-set-key (kbd "C-c c") 'compile)))
(add-hook 'c++-mode-hook
	  (lambda () (define-key evil-normal-state-map (kbd "<C-SPC>") 'swap)))
(projectile-load-known-projects)

(require 'nlinum)
(add-hook 'c++-mode-hook
	  (lambda () (nlinum-relative-mode)))

(require 'evil)
(require 'helm)
(require 'helm-files)
(require 'neotree)
(defun add (k-map binding func)
    "Given K-MAP BINDING and FUNC."
    (interactive)
    (define-key k-map (kbd binding) func)
    )
(defun set-main-keymaps()
    "Set keymaps."
    (let ((map (make-sparse-keymap))
	(e-normal evil-normal-state-map))
    (progn
	;(evil-ex-define-cmd "q" 'kill-this-buffer)
	;(evil-ex-define-cmd "quit" 'evil-quit)
	(add map "C-x b" 'helm-buffers-list)
	(add map "C-x f" 'helm-find-files)
	(add e-normal "<SPC> b d" 'kill-current-buffer)
	(add e-normal "<SPC> b b" 'helm-buffers-list)
	(add e-normal "<SPC> b p" 'previous-buffer)
	(add e-normal "<SPC> b n" 'next-buffer)
	(add e-normal "<SPC> w k" 'windmove-up)
	(add e-normal "<SPC> w j" 'windmove-down)
	(add e-normal "<SPC> w h" 'windmove-left)
	(add e-normal "<SPC> w l" 'windmove-right)
	(add e-normal "<SPC> w /" (lambda ()
				    (interactive)
				    (progn
				      (split-window-right)
				      (windmove-right))))
	(add e-normal "<SPC> w -" (lambda ()
				    (interactive)
				    (progn
				      (split-window-below)
				      (windmove-down))))
	(add e-normal "<SPC> f f" 'helm-find-files)
	(add e-normal "<SPC> <SPC>" 'helm-M-x)
	(add e-normal "<SPC> f t" 'neotree-toggle)
	(add e-normal "<SPC> p f"
	(defun project-dir ()
	    (interactive)
	    (helm-find-files-1 "~/projects/")))
	(add e-normal "<SPC> f e d"
	(defun main-config()
	    (interactive) (find-file "~/.emacs.d/main.org")))
	(add e-normal "<SPC> b h"
	     (defun home-buffer()
	       (interactive) (find-file "~/.emacs.d/.home.org")))
	)
    map))
(set-main-keymaps)

(require 'helm)
(require 'helm-files)
(require 'helm-command)
;(global-unset-key (kbd "\C-f"))
;(local-unset-key (kbd "\C-f"))
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

(require 'doom-themes)
(load-theme 'doom-Iosvkem t)

(mapc (lambda (x) (print x)) (custom-available-themes))

(let ((first 90)
      (second 86))
  (set-frame-parameter (selected-frame) 'alpha (list first second))
  (add-to-list 'default-frame-alist (list 'alpha first second)))

(custom-set-faces
 '(ido-subdir ((t (:foreground "#66ff00")))) ;; Face used by ido for highlighting subdirs in the alternatives.
 '(ido-first-match ((t (:foreground "#ccff66")))) ;; Face used by ido for highlighting first match.
 '(ido-only-match ((t (:foreground "#ffcc33")))) ;; Face used by ido for highlighting only match.
 '(ido-indicator ((t (:foreground "#ffffff")))) ;; Face used by ido for highlighting its indicators (don't actually use this)
 '(ido-incomplete-regexp ((t (:foreground "#ffffff")))) ;; Ido face for indicating incomplete regexps. (don't use this either
 )

(add-to-list 'display-buffer-alist
	     `(,(rx bos "*helm" (* not-newline) "*" eos)
		  (display-buffer-in-side-window)
		  (inhibit-same-window . t)
		  (window-height . 0.33)))

(show-paren-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
