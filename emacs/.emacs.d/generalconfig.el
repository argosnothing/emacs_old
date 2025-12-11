;;; package --- summary
;;; Commentary:
;;; Code:
(use-package company
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (setq company-idle-delay 0)))
(use-package flycheck
  :config
  (progn
    (global-flycheck-mode)))

(show-paren-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; Local Variables:
;; bye-compiler-warnings: (not free-vars)
;; End:
;;; generalconfig.el ends here
