
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(package-initialize)

(setq make-backup-files nil)
(setq truncate-partial-width-windows t)   ;; wrap lines
(set-default 'truncate-lines t)
(setq inferior-ess-r-program "/usr/local/bin/R")
(setq ess-indent-with-fancy-comments nil)

(setq-default indent-tabs-mode t)
(setq visible-bell 1)
(set-default-font "-adobe-courier-medium-r-normal--18-*")
;; (set-default-font "-adobe-courier-medium-r-normal--17-*")
;;(set-default-font "-adobe-courier-medium-r-normal--15-*")
;;(set-default-font "-adobe-courier-bold-r-normal--16-*-100-100-m-90-iso10646-1")

(set-background-color "#E8E8E8")
(set-face-attribute 'region nil :background "#FCA")

(defun call (who)
  "returns all lines in my phone-numbers file which match the supplied string"
  (interactive "swho? ")
  (setq filename (expand-file-name "~pshannon/notes/phone-numbers"))
  (setq call-buffer (get-buffer-create "*call*"))
  (switch-to-buffer-other-window call-buffer)
  (call-process (expand-file-name "~/bin/call") nil call-buffer nil who))

(defun pw (who)
  "returns all lines in ~/s/notes/pwi file which match the supplied string"
  (interactive "swho? ")
  (setq filename (expand-file-name "~pshannon/notes/pwi"))
  (setq pw-buffer (get-buffer-create "*pw*"))
  (switch-to-buffer-other-window pw-buffer)
   (call-process "~/bin/pw" nil pw-buffer nil who))

(defun new-shell (title)
  "create a new shell in its own buffer, with the interactively supplied title"
  (interactive "stitle? ")
  (shell title)
  (rename-buffer title)
  )

(defun r (title)
  "create a R buffer, give it a title "
  (interactive "stitle? ")
  (R)
  (rename-buffer title)
  )


(defun pick-buffer ()
  "run list-buffers in a single window"
  (interactive)
  ;;(split-window-vertically)
  (list-buffers)
  (switch-to-buffer "*Buffer List*" FORCE-SAME-WINDOW)
  ;; (delete-other-windows)
  );

(global-unset-key (kbd "C-]"))
(global-set-key "" 'new-shell)
(global-set-key "" 'pick-buffer)
(global-set-key "" 'delete-backward-char)
(global-set-key "" 'save-some-buffers)
(global-set-key "" 'goto-line)

(global-set-key [f6] 'goto-line)
(global-set-key [f7] 'jump-to-register)
(global-set-key [f8] 'window-configuration-to-register)
(global-set-key [f9] 'other-window)
;;(global-set-key [f10] 'start-kbd-macro)
;;(global-set-key [f11] 'end-kbd-macro)
;;(global-set-key [f12] 'call-last-kbd-macro)

(global-set-key [(control f10)] 'start-kbd-macro)
(global-set-key [(control f11)] 'end-kbd-macro)
(global-set-key [(control f12)] 'call-last-kbd-macro)


;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(ess-default-style (quote OWN))
;; '(ess-indent-offset 20 t)
;; '(ess-indent-with-fancy-comments nil)
;; '(ess-own-style-list
;;   (quote
;;    ((ess-indent-offset . 3)
;;     (ess-offset-arguments . open-delim)
;;     (ess-offset-arguments-newline . prev-call)
;;     (ess-offset-block . open-delim)
;;     (ess-offset-continued . straight)
;;     (ess-align-nested-calls "ifelse")
;;     (ess-align-arguments-in-calls "function[ 	]*(")
;;     (ess-align-continuations-in-calls . t)
;;     (ess-align-blocks control-flow)
;;     (ess-indent-from-lhs arguments fun-decl-opening)
;;     (ess-indent-from-chain-start . t)
;;     (ess-indent-with-fancy-comments))))
;; '(inferior-R-program-name "/usr/bin/R"))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; )

(put 'narrow-to-region 'disabled nil)
(add-to-list 'load-path "~/github/ESS/lisp")
(load "ess-site") 
(ess-toggle-underscore nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-use-system-font t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 126 :width normal)))))

