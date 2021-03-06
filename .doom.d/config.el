;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "baldore"
      user-mail-address "acornssn@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory (or (getenv "ORGDIR") "~/org"))

(setq org-roam-directory (or (getenv "ROAMDIR") "~/roam"))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!'for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; evil config
(setq evil-snipe-scope 'buffer)

;; custom evil mappings
(map! :n ":" #'evil-repeat-find-char
      :n ";" #'evil-ex)

;; avy
(map! :n "C-j" #'evil-avy-goto-char-2)
(setq avy-all-windows t)

;; flycheck
(setq flycheck-javascript-eslint-executable
      (executable-find "eslint_d"))

(setq select-enable-primary t)
(defun my-org-paste-image ()
  "Paste an image into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (let* ((target-file
          (concat
           (make-temp-name
            (concat (buffer-file-name)
                    "_"
                    (format-time-string "%Y%m%d_%H%M%S_"))) ".png"))
         (wsl-path
          (concat (as-windows-path(file-name-directory target-file))
                  "\\"
                  (file-name-nondirectory target-file)))
         (ps-script
          (concat "(Get-Clipboard -Format image).Save('" wsl-path "')")))

    (powershell ps-script)

    (if (file-exists-p target-file)
        (progn (insert (concat "[[" target-file "]]"))
               (org-display-inline-images))
      (user-error
       "Error pasting the image, make sure you have an image in the clipboard!"))
    ))

(defun as-windows-path (unix-path)
  "Takes a unix path and returns a matching WSL path (e.g. \\\\wsl$\\Ubuntu-20.04\\tmp)"
  ;; substring removes the trailing \n
  (substring
   (shell-command-to-string
    (concat "wslpath -w " unix-path)) 0 -1))

;; evil star stay
(defun my/star-keep-position ()
  (interactive)
  (case evil-search-module
    (evil-search (progn
                  (evil-ex-search-word-forward)
                  (evil-ex-search-previous)))
    (isearch (progn
               (evil-search-word-forward)
               (evil-search-previous)))))

(defun my/visualstar-keep-position ()
  (interactive)
  (when (region-active-p)
    (evil-visualstar/begin-search (region-beginning) (region-end) t)
    (case evil-search-module
      (evil-search (evil-ex-search-previous))
      (isearch (evil-search-previous)))))

(map! :n "*" 'my/star-keep-position)
(map! :v "*" 'my/visualstar-keep-position)
