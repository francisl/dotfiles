;; Packages
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

(add-to-list 'tls-program "openssl s_client -connect %h:%p -no_ssl2 -ign_eof -servername %h" t)
;; (let ((archive (or (getenv "FRONTMACS_ARCHIVE") "https://elpa.frontside.io/")))
;;   (add-to-list 'package-archives (cons "frontside" archive) t))


(unless (package-installed-p 'exec-path-from-shell)
  (package-refresh-contents)
  (package-install 'exec-path-from-shell))

;; FLYCHECK
(unless (package-installed-p 'flycheck)
  (package-refresh-contents)
  (package-install 'flycheck))

;; Reason setup
(unless (package-installed-p 'reason-mode)
  (package-refresh-contents)
  (package-install 'reason-mode))

(unless (package-installed-p 'neotree)
  (package-refresh-contents)
  (package-install 'neotree t))
