;;; init-projectile.el -- Setup projectile
;;; Commentary:


(unless (package-installed-p 'projectile)
  (package-refresh-contents)
  (package-install 'projectile t))

(provide 'init-projectile)
;;; init-projectile.el
