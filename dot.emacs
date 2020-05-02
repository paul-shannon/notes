;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
;;(require 'diminish)
;;(require 'bind-key)


(load-file "~/github/notes/lushootseedCharacters.el")


;;---------------------------------------------------------
;; setup python, elpy
;;---------------------------------------------------------
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(setq elpy-rpc-python-command  "/users/paul/anaconda/bin/python3")
(setq python-shell-interpreter "/users/paul/anaconda/bin/python3")
(setq scroll-down-aggressively 1)

(setq make-backup-files nil)
(setq truncate-partial-width-windows t)   ;; wrap lines
(set-default 'truncate-lines t)
(setq inferior-ess-r-program "/usr/local/bin/R")



;;--------------------------------------------------------
;; setup matlab
;;--------------------------------------------------------
;;(add-to-list 'load-path "~/github/matlab-emacs-src/")
;;(require 'matlab-load)

;;(add-to-list 'load-path "/Users/paul/github/matlab-emacs-src") ;;/path/to/matlab-emacs")
;;(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
;;(require 'matlab-load)
;;(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
;;(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))
;;
;;(setq matlab-shell-command "matlab")
;;(setq matlab-shell-command "/Applications/MATLAB_R2020a.app/bin/matlab")
;;(setq matlab-shell-command-switches (list "-nodesktop"))
;;
;;(setq matlab-indent-level 2
;;      matlab-indent-function-body nil  
;;      matlab-highlight-cross-function-variables t
;;      matlab-return-add-semicolon t
;;      matlab-show-mlint-warnings t 
;;      mlint-programs '("/Applications/MATLAB_R2020a.app/bin/maci64/mlint")  
;;      ;;matlab-mode-install-path (list (expand-file-name "~/.emacs.d/elisp/matlab/"))
;;      )
;;
;;(defun my-matlab-hook ()
;;   (mlint-minor-mode 1))
;;
;;(add-hook 'matlab-mode-hook 'my-matlab-hook)
;;
;;(autoload 'mlint-minor-mode "mlint" nil t)  
;;(add-hook 'matlab-mode-hook (lambda () (mlint-minor-mode 1)))
;;(add-hook 'matlab-shell-mode-hook 'ansi-color-for-comint-mode-on)
;;(add-hook 'matlab-shell-mode-hook (lambda () (setenv "LANG" "C")))
;;(eval-after-load "shell"  
;;	  '(define-key shell-mode-map [down] 'comint-next-matching-input-from-input))
;;(eval-after-load "shell"
;;	  '(define-key shell-mode-map [up] 'comint-previous-matching-input-from-input))



;;(load-library "matlab-load")
;;(load-library "mlint")
;;(autoload 'mlint-minor-mode "mlint" nil t)
;; (matlab-cedet-setup)
;;(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
;;(add-to-list
;;  'auto-mode-alist
;;  '("\\.m$" . matlab-mode))
;;(setq matlab-indent-function t)
;;(setq matlab-shell-command "matlab")
;;(setq matlab-shell-command "/Applications/MATLAB_R2020a.app/bin/matlab")
;;(setq matlab-shell-command-switches (list "-nodesktop"))




(setq-default indent-tabs-mode t)
(setq visible-bell 1)
(set-default-font "-adobe-courier-medium-r-normal--18-*")
;; (set-default-font "-adobe-courier-medium-r-normal--17-*")
;;(set-default-font "-adobe-courier-medium-r-normal--15-*")
;;(set-default-font "-adobe-courier-bold-r-normal--16-*-100-100-m-90-iso10646-1")

(set-background-color "LightYellow2")
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
;;(load "ess-site") 
(ess-toggle-underscore nil)

;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(font-use-system-font t))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 126 :width normal)))))

(setq ess-indent-with-fancy-comments nil)
(setq ess-fancy-comments nil)


;; to handle the elpy warning:

(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))
