;;; init-neotree --- Setup neotree
;;; Commentary:
;;; Code:

;; slated for eventual use once I hack neotree together, maybe
;; doesn't work with URxvt.  Maybe switch to a more feature rich terminal?
(use-package all-the-icons
  :config
  (let* ((font-check-file (expand-file-name "fonts-installed" user-emacs-directory))
         (fonts-installed (file-exists-p font-check-file))
         )
    (when (not fonts-installed)
      (all-the-icons-install-fonts)
      (write-region "" nil font-check-file)
      )
    )
  )

(use-package neotree
  :after (all-the-icons)
  :pin melpa
  :config
  (setq neo-autorefresh t
        neo-show-hidden-files t
        neo-create-file-auto-open t
        neo-theme 'nerd)
  (neo-global--open) ;; automatically open neotree on startup
  (other-window 1)   ;; select the default window instead of the tree
  )

(provide 'init-neotree)
;;; init-neotree.el ends here
