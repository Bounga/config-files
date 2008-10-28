;; ===============================================================
;; File:                 $HOME/.emacs.el
;; Purpose:              Setup file for program "(GNU) emacs"
;; written by:           Nicolas Cavigneaux <nico@bounga.org>
;; Latest change:        Sat Sun 06 22:05:32 CEST 2003
;; Latest user version:  emacs 21.3
;; ===============================================================
;;
;; ===============================================================
;; SEE ALSO:
;; ===============================================================
;; EMACS Pages:
;; http://www.gnu.org/software/emacs/
;;
;; EMACS French Pages:
;; http://www.emacsfr.org/
;;
;; MailingList:
;; http://savannah.gnu.org/mail/?group_id=40

;; ===============================================================
;; BASE SETTINGS
;; ===============================================================

;; Enable debug mode if it's not comment out
;; (setq debug-on-error t)

;; path where Emacs can find some additionnal lisp functions
(add-to-list 'load-path "~/.elisp/")

;; Setting colors (i hate white background)
(set-foreground-color "AntiqueWhite")
(set-background-color "Black")

;; Delete useless tools (in X mode)
(tool-bar-mode nil)
(menu-bar-mode nil)
(scroll-bar-mode nil)

;; Font Lock (Syntaxe highlighting)
(require 'font-lock)
(setq initial-major-mode
      (lambda ()
	(text-mode)
	(font-lock-mode)))
(setq font-lock-mode-maximum-decoration t
      font-lock-use-default-fonts t
      font-lock-use-default-colors t)

(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode t))

;; Hooks for text-mode :
;; In all modes depending on text mode, flyspell and autofill are enable.
;; The maximum column number is set to 70
(setq ispell-dictionary "francais")
(add-hook 'text-mode-hook
	  '(lambda()
	     (flyspell-mode)
	     (turn-on-auto-fill)
	     (setq fill-column 70)))

;; remove old buffers at midnight
(setq midnight-mode t)

;; If it's not comment out, the paste are made where the cursor is 
;; and not at not mouse position
;;(setq mouse-yank-at-point t)

;; backup handling
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))          ; don't litter my fs tree
 delete-old-versions t
 auto-save-default nil
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

;; Names for calendar command.
;; These should be derived from nl_langinfo() by emacs
(defvar calendar-day-name-array
  ["dim" "lun" "mar" "mer" "jeu" "ven" "sam"])
(defvar calendar-month-name-array
  ["janvier" "février" "mars" "avril" "mai" "juin" 
   "juillet" "août" "septembre" "octobre" "novembre" "décembre"])

;; Diary settings
(setq view-diary-entries-initially t
       mark-diary-entries-in-calendar t
       number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;; Fonts to use in X mode
(if (getenv "DISPLAY")
    (custom-set-faces
     '(default ((t (:stipple nil :background "Black" :foreground "AntiqueWhite" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 108 :width normal :family "fixed")))))
  )

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(speedbar-directory-button-trim-method (quote trim))
 '(speedbar-hide-button-brackets-flag t)
 '(speedbar-track-mouse-flag t)
 '(speedbar-use-images t)
 '(transient-mark-mode t)
 '(truncate-lines nil))

;; Accent handling
(set-terminal-coding-system 'latin-1)
(set-keyboard-coding-system 'latin-1)
(set-language-environment 'latin-1)

;; Enable iswitch (alternative switch buffer methods)
(require 'iswitchb)
(iswitchb-default-keybindings)

;; Enable dired-x (alternative to dired mode)
(eval-after-load "dired" '(require 'dired-x))

;; Enable speedbar
(require 'speedbar)

;; ====================================================================
;; Programming settings
;; ====================================================================

(show-paren-mode t) ;; shows the parenthesis couple

;; This function is used to find a parenthesis corresponding to another 
;; using ' %' key
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; C-Mode 
;; Enable the auto-state mode for C language and derivate
(add-hook 'c-mode-common-hook 'c-toggle-auto-state)

;; Use spaces to do the tabulations
(setq indent-tabs-mode nil)

;; LaTeX mode
;; For all mode depending on the LaTeX mode:
;; lines are cut after 74 columns
(defun nico-latex-hooks ()
  (progn
    (turn-on-auto-fill)
    (setq fill-column 74)

;; Automatically insert a file in the new .tex files
(add-hook 'find-file-hooks 'auto-insert)
(load-library "autoinsert")
(setq auto-insert-directory "~/Projets/mes_codes/tex/")
(setq auto-insert-alist '((latex-mode . "tex-insert.tex")))
))
(add-hook 'LaTeX-mode-hook 'nico-latex-hooks)

;; =======================================================================
;; Miscellaneous
;; =======================================================================

;; Prints the file name we are currently editing
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

;; Activate mouse wheel
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

;; We don't want blank lines at the end of files
(setq next-line-add-newlines nil)

;; I want to use aspell rather than ispell
(setq ispell-program-name "aspell")

;; Bindkey for the goto-line function
(global-set-key "\C-cl" 'goto-line)