;;; package --- summary
;;; Commentary:
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "49ec957b508c7d64708b40b0273697a84d3fee4f15dd9fc4a9588016adee3dad" "9954ed41d89d2dcf601c8e7499b6bb2778180bfcaeb7cdfc648078b8e05348c6" "a8c210aa94c4eae642a34aaf1c5c0552855dfca2153fa6dd23f3031ce19453d4" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "fd944f09d4d0c4d4a3c82bd7b3360f17e3ada8adf29f28199d09308ba01cc092" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" default)))
 '(exwm-input-global-keys
   (quote
    (([8388722]
      . exwm-reset)
     ([8388721]
      . delete-window)
     ([8388655]
      lambda nil
      (interactive)
      (progn
	(split-window-right)
	(windmove-right)
	(helm-buffers-list)))
     ([8388653]
      lambda nil
      (interactive)
      (progn
	(split-window-below)
	(windmove-down)
	(helm-buffers-list)))
     ([8388727]
      . exwm-workspace-switch)
     ([8388723]
      lambda
      (command)
      (interactive
       (list
	(read-shell-command "$ ")))
      (start-process-shell-command command nil command))
     ([8388728]
      . helm-M-x)
     ([8388712]
      . windmove-left)
     ([8388716]
      . windmove-right)
     ([8388714]
      . windmove-down)
     ([8388715]
      . windmove-up)
     ([8388706]
      . helm-buffers-list)
     ([8388717]
      . maximize-window)
     ([8388710]
      . helm-find-files)
     ([142606381]
      lambda
      (command)
      (interactive
       (list
	(read-shell-command "OPENDOWN$ ")))
      (progn
	(split-window-below)
	(windmove-down)
	(start-process-shell-command command nil command)))
     ([142606383]
      lambda
      (command)
      (interactive
       (list
	(read-shell-command "OPENRIGHT$ ")))
      (progn
	(split-window-right)
	(windmove-right)
	(start-process-shell-command command nil command)))
     ([8388708]
      . kill-current-buffer)
     ([142606440]
      lambda nil
      (interactive)
      (find-file "~/.emacs.d/.home.org"))
     ([XF86AudioRaiseVolume]
      lambda nil
      (interactive)
      (shell-command "pulseaudio-ctl up"))
     ([XF86AudioLowerVolume]
      lambda nil
      (interactive)
      (shell-command "pulseaudio-ctl down")))))
 '(fci-rule-color "#505050")
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(jdee-db-active-breakpoint-face-colors (cons "#1b1d1e" "#fc20bb"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1b1d1e" "#60aa00"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1b1d1e" "#505050"))
 '(objed-cursor-color "#d02b61")
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (bash-completion spacemacs-theme ## irony-eldoc irony org-super-agenda ox-twbs gruber-darker-theme htmlize org-bullets flycheck use-package neotree doom-themes solarized-theme nlinum-relative which-key flymake-cppcheck projectile company-mode gruvbox-theme company helm evil-visual-mark-mode)))
 '(pdf-view-midnight-colors (quote ("#282828" . "#f9f5d7")))
 '(vc-annotate-background "#1b1d1e")
 '(vc-annotate-color-map
   (list
    (cons 20 "#60aa00")
    (cons 40 "#859f0d")
    (cons 60 "#aa931a")
    (cons 80 "#d08928")
    (cons 100 "#d38732")
    (cons 120 "#d6863d")
    (cons 140 "#da8548")
    (cons 160 "#ce8379")
    (cons 180 "#c281aa")
    (cons 200 "#b77fdb")
    (cons 220 "#bf63b2")
    (cons 240 "#c74789")
    (cons 260 "#d02b61")
    (cons 280 "#b0345c")
    (cons 300 "#903d58")
    (cons 320 "#704654")
    (cons 340 "#505050")
    (cons 360 "#505050")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-first-match ((t (:foreground "#ccff66"))))
 '(ido-incomplete-regexp ((t (:foreground "#ffffff"))))
 '(ido-indicator ((t (:foreground "#ffffff"))))
 '(ido-only-match ((t (:foreground "#ffcc33"))))
 '(ido-subdir ((t (:foreground "#66ff00")))))
(org-babel-load-file "~/.emacs.d/main.org")
;;; init.el ends here
