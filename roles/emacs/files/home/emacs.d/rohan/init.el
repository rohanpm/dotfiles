(require 'package)
(package-initialize)
(add-to-list 'package-archives
  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(defun rohan--ensure-installed (sym)
  (if (not (package-installed-p sym))
      (package-install sym)))

(if (and (boundp 'rohan--init-packages) rohan--init-packages)
    (progn
      (package-list-packages)
      (rohan--ensure-installed 'helm)
      ; this is not in melpa-stable?
      ;(rohan--ensure-installed 'helm-git-grep)
      (rohan--ensure-installed 'cider)
      (rohan--ensure-installed 'projectile)
      (rohan--ensure-installed 'paredit)
      (rohan--ensure-installed 'company)
      ;(rohan--ensure-installed 'yaml-mode)
      ))

(helm-mode)
(recentf-mode)
(projectile-global-mode)

; key bindings
(global-set-key (kbd "C-c g") 'helm-git-grep)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-mode-hook 'cider-eval-ns-form)
(add-hook 'cider-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'company-mode)
(setq cider-auto-select-error-buffer nil)
;(setq cider-stacktrace-default-filters '(java))
