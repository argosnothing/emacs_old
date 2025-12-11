;;; package --- summary
;;; Configuration for c++ devl
;;; Code:
;;; Commentary:
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
;;; c++config.el ends here
