(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("ba4ab079778624e2eadbdc5d9345e6ada531dc3febeb24d257e6d31d5ed02577" default))
 '(package-selected-packages '(leaf-keywords hydra gruber-darker-theme el-get blackout))
 '(zoom-mode t nil (zoom))
 '(zoom-size '(0.618 . 0.618)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; generic emacs settings
(progn
  (setenv "NODE_PATH" "/Users/jumang4423/node_modules")
  (setq display-time-interval 1)
  (setq display-time-string-forms
	'((format "%s:%s:%s" 24-hours minutes seconds)))
  (setq display-time-day-and-date t)
  (display-time-mode t)
  (nyan-mode)
  (beacon-mode)
  (global-set-key (kbd "C-c v") #'multi-vterm))
(put 'customize-themes 'disabled nil)

;; flash when trying to save files
(add-hook 'after-save-hook
	  (lambda ()
            (let ((orig-fg (face-background 'mode-line)))
	      (set-face-background 'mode-line "dark green")
	      (run-with-idle-timer 0.4 nil
				   (lambda (fg) (set-face-background 'mode-line fg))
				   orig-fg))))


;; C-x C-t fix into M-n|p
(progn
  (defun dusdanig-aprox-begin-of-line ()
    "Check whether I am on the begin or end of a line"
    (< (- (point) (line-beginning-position))
       (- (line-end-position) (point))))
  (defun dusdanig-move-line-up ()
    "Move up the current line."
    (interactive)
    (transpose-lines 1)
    (forward-line -2)
    (indent-according-to-mode)
    (beginning-of-line))
  (defun dusdanig-move-line-down ()
    "Move down the current line."
    (interactive)
    (forward-line 1)
    (transpose-lines 1)
    (forward-line -1)
    (indent-according-to-mode)
    (end-of-line))
  (global-set-key (kbd "M-n") 'dusdanig-move-line-down)
  (global-set-key (kbd "M-p") 'dusdanig-move-line-up))

(progn
  ;; tidal and haskell-mode
  (progn
    (defun tidal-opn-sound-lib-jumango-fun ()
      "sound library. this opens sound library folder in dired, also set keybind for playing music with bongo"
      (interactive)
      ;; macOS sample folder
      (setq macos-jumango-sample-folder "/Users/jumang4423/Library/Application Support/SuperCollider/downloaded-quarks/Dirt-Samples")
      (require 'bongo)
      ;; this xenables to play sound on dired
      (global-set-key (kbd "C-M-g") 'bongo-dired-play-line)
      (when (eq system-type 'darwin)
        (progn
	  ;; open bongo and insert sample lib dir
          (dired macos-jumango-sample-folder)))
      (when (eq system-type 'gnu/linux)
        ())))

  (use-package tidal
    :config
    (defun tidal-hush ()
      "hush every sounds"
      (interactive)
      (tidal-send-string ":{")
      (tidal-send-string " hush")
      (tidal-send-string ":}"))
    (defun tidal-panic ()
      "hush every sounds"
      (interactive)
      (tidal-send-string ":{")
      (tidal-send-string " panic")
      (tidal-send-string ":}"))
    (defun tidal-stop-d1 ()
      "stop specific sound"
      (interactive)
      (tidal-send-string ":{")
      (tidal-send-string " mapM_ ($ silence) [d1]")
      (tidal-send-string ":}"))
    (defun tidal-stop-d2 ()
      "stop specific sound"
      (interactive)
      (tidal-send-string ":{")
      (tidal-send-string " mapM_ ($ silence) [d2]")
      (tidal-send-string ":}"))
    (defun tidal-stop-d3 ()
      "stop specific sound"
      (interactive)
      (tidal-send-string ":{")
      (tidal-send-string " mapM_ ($ silence) [d3]")
      (tidal-send-string ":}"))
    (defun tidal-stop-d4 ()
      "stop specific sound"
      (interactive)
      (tidal-send-string ":{")
      (tidal-send-string " mapM_ ($ silence) [d4]")
      (tidal-send-string ":}"))
    (defun tidal-stop-d5 ()
      "stop specific sound"
      (interactive)
      (tidal-send-string ":{")
      (tidal-send-string " mapM_ ($ silence) [d5]")
      (tidal-send-string ":}"))
    (defun tidal-stop-d6 ()
      "stop specific sound"
      (interactive)
      (tidal-send-string ":{")
      (tidal-send-string " mapM_ ($ silence) [d6]")
      (tidal-send-string ":}"))
    (defun tidal-stop-d7 ()
      "stop specific sound"
      (interactive)
      (tidal-send-string ":{")
      (tidal-send-string " mapM_ ($ silence) [d7]")
      (tidal-send-string ":}"))
    (defun tidal-stop-d8 ()
      "stop specific sound"
      (interactive)
      (tidal-send-string ":{")
      (tidal-send-string " mapM_ ($ silence) [d8]")
      (tidal-send-string ":}"))
    (defun tidal-stop-d9 ()
      "stop specific sound"
      (interactive)
      (tidal-send-string ":{")
      (tidal-send-string " mapM_ ($ silence) [d9]")
      (tidal-send-string ":}"))))

;; slime
(progn
  (setq inferior-lisp-program "sbcl"))

;; dired
(progn
  (setq dired-dwim-target t)
  (setq dired-recursive-copies 'always)
  (setq dired-isearch-filenames t))

;; recentf
(progn
  (setq recentf-max-saved-items 2000)
  (setq recentf-auto-cleanup 'never)
  (setq recentf-exclude '("/recentf" "COMMIT_EDITMSG" "/.?TAGS" "^/sudo:" "/\\.emacs\\.d/games/*-scores" "/\\.emacs\\.d/\\.cask/"))
  (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1)
  (global-set-key (kbd "\C-c t") 'helm-recentf))

;; fzf
(progn
  (global-set-key (kbd "C-c f") 'fzf))
