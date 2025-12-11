;;; package --- summary
;;; Basic configuration for appearance

;;; Commentary:
;;; Nothing terribly interesting or complicated

;;; Code:
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

(load-theme 'gruvbox)
;;; appearance.el ends here
