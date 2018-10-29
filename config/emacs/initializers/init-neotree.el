;;; init-neotree.el -- Setup neotree
;;; Commentary:

(require 'neotree)

(global-set-key [(control ?c) (control ?b)] 'neotree-toggle)

(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)

(neotree-toggle)

(provide 'init-neo/tree)
;;; init-neotree.el
