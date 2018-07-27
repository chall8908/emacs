;;; init-package --- Setup package management
;;; Commentary:
;;; Code:

;; configure elpa directory
(setq package-user-dir (expand-directory-name "elpa" user-emacs-directory))

;; ensure package directory exists
(make-directory package-user-dir t)

(setq package-archives '()      ; unset package archives
      byte-compile-warnings nil ; don't show compile warnings
      )

;; Require package
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

;; tell Emacs not to enable packages, since we are
(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

(eval-when-compile
  (require 'use-package))

;; IMPORTANT: Packages only on melpa need to be manually `:pin'd to `melpa'
(setq use-package-always-pin "melpa-stable")
; tell use-package to install all packages automatically
(setq use-package-always-ensure t)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe)
  )

(use-package diminish)

(provide 'init-package)
;;; init-package.el ends here
