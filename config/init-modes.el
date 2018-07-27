;;; init-modes.el --- Initialize all modes used -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-directory-name "modes" config-dir))

(use-package python-mode
  :mode "\.py$"
  )

(use-package yaml-mode
  :mode "\.yaml$"
  )

(use-package groovy-mode
  :mode "\.groovy$"
  :config
  (setq groovy-indent-offset 2)
  )

(use-package css-mode
  :mode "'\.css$"
  )

(use-package scss-mode
  :after (css-mode)
  :mode "'\.s[ca]ss$"
  )

;; Sql Mode
(eval-after-load "sql"
  '(load-library "sql-indent"))
(add-hook 'sql-mode-hook 'sql-highlight-postgres-keywords)

(require 'elixir)
(require 'git)
(require 'markdown)
(require 'js2)
(require 'web)
(require 'emmet)

(provide 'init-modes)

;;; init-modes.el ends here
