(require 'package)
(require 'tls)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "MELPA" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "MELPA Stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("GNU" . (concat proto "://elpa.gnu.org/packages/")))))

(setq package-archive-priorities
      '(("MELPA Stable" . 10)
        ("MELPA" . 5)
        ("GNU" . 0))
      package-pinned-packages
'((js2-mode . "MELPA")))

(package-initialize)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(if (display-graphic-p)
    (desktop-save-mode 1))

;; FLYCHECK
(require 'flycheck)
(setq-default flycheck-disabled-checker '(emacs-lisp-checkdoc))
(global-flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'rjsx)
(flycheck-add-mode 'javascript-eslint 'javasscript)

(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
	  '(json-jsonlist)))

(global-auto-revert-mode t)

;;----------------------------------------------------------------------------
;; Reason setup
;;----------------------------------------------------------------------------
(require 'reason-mode)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key (kbd "S-C-<down>") 'shrink-window)

(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 4)))

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq-local c-basic-offset n)
  ;; web development
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n)
  (setq c-basic-offset n)
  (setq tab-width n))

(defun office-code-style ()
  (interactive)
  (message "Office code style!")
  (my-setup-indent 4)
  (setq indent-tabs-mode t))

(defun own-code-style ()
  (interactive)
  (message "own code style!")
  (my-setup-indent 4)
  (setq-default indent-tabs-mode nil))

(defun setup-develop-environment ()
  (interactive)
  (if (file-exists-p (substitute-in-file-name "$HOME/workspace/.work"))
    (office-code-style)
    (own-code-style)))

(add-hook 'prog-mode-hook 'setup-develop-environment)
(add-hook 'web-mode-hook 'setup-develop-environment)

(load-file
  (expand-file-name "initializers/init-neotree.el" user-emacs-directory))
