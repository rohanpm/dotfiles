(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defun rohan--ensure-installed (sym)
  (if (not (package-installed-p sym))
      (package-install sym)))

(if (and (boundp 'rohan--init-packages) rohan--init-packages)
    (progn
      (package-list-packages)
      (rohan--ensure-installed 'helm)
      (rohan--ensure-installed 'helm-git-grep)
      (rohan--ensure-installed 'cider)
      (rohan--ensure-installed 'yaml-mode)))

(helm-mode)
(recentf-mode)


; key bindings
(global-set-key (kbd "C-c g") 'helm-git-grep)
