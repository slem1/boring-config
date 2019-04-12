;; PROXY SAMPLE
;; (setq url-proxy-services
;;      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;            ("http" . "hostname:port")
;;            ("https" . "hostname:port")))


;; ENABLE MELPA
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
;; (toggle-debug-on-error)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; ENABLE SPACEMACS THEME
;; spacemacs
(use-package spacemacs-theme
  :defer t
  :init
  (load-theme 'spacemacs-dark t)
  (setq spacemacs-theme-org-agenda-height nil)
  (setq spacemacs-theme-org-height nil))

;; ENABLE SPACELINE EMACS THEME
(use-package spaceline
  :demand t
  :init
  (setq powerline-default-separator 'arrow-fade)
  :config
  (require 'spaceline-config)
  (spaceline-emacs-theme))

;; MAC CONFIGURATION
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

(global-set-key (kbd "M-<f10>") 'toggle-frame-fullscreen)
(global-set-key (kbd "M-f") 'toggle-frame-maximized)


;; TMP AND BACKUP FILES
(setq backup-directory-alist `(("." . "~/.saves")))

;;MARKDOWN
(setq markdown-command "pandoc")

;;NEOTREE
(use-package neotree
  :ensure t
  :init
  :bind (("<f8>" . neotree-toggle))
  :defer
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  ;;  (setq neo-window-fixed-size nil)
  (setq neo-window-width 35)
  (setq-default neo-show-hidden-files t)
  )


;;ALL-THE-ICONS
(use-package all-the-icons)

;;DISABLE WELCOME GNU BUFFER
(setq inhibit-startup-screen t)


;;FIND FILE IN PROJECT
(use-package find-file-in-project
  :ensure t
  :bind (("C-n" . find-file-in-project-by-selected))
  :bind (("C-S-n" . find-file-in-project))
  :init
  (setq ffip-project-root ".")
  )

;;MULTIPLE CURSORS
(use-package multiple-cursors
  :ensure t
  :init
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (multiple-cursors json-mode find-file-in-project neotree haskell-mode markdown-mode+ spaceline use-package spacemacs-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; HIDE STUFF
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; RUN AT STARTUP...
(toggle-frame-maximized)
;;(neotree-show)
