;;; package --- summary
;;; Custom keybindings
;;; Commentary:
;;; Code:
(require 'evil)
(require 'helm)
(require 'helm-files)
(require 'neotree)
(setq ring-bell-function 'ignore)
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
      (add e-normal "<SPC> w /" 'split-window-right)
      (add e-normal "<SPC> w -" 'split-window-below)
      (add e-normal "<SPC> f f" 'helm-find-files)
      (add e-normal "<SPC> <SPC>" 'helm-M-x)
      (add e-normal "<SPC> f t" 'neotree-toggle)
      (add e-normal "<SPC> p f"
        (defun project-dir ()
	  (interactive)
	  (helm-find-files-1 "~/projects/")))
      (add e-normal "<SPC> f e d"
        (defun main-config()
	  (interactive) (find-file "~/.emacs")))
      )
    map))

(set-main-keymaps)

;;; custombindings.el ends here
