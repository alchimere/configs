(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "~/.emacs.d/tweaks")

(setq display-time t
      display-time-24hr-format t)
(display-time)


;; to setup tabs
;(setq c-basic-indent 2)
;(setq tab-width 4)
(setq-default indent-tabs-mode nil)
;(setq highlight-tabs)
(load "~/.emacs.d/guess-offset.el")
(require 'guess-offset)


     ;; Yasnippet
     (add-to-list 'load-path "~/.emacs.d/elisp/yasnippet-0.6.1c")
     (require 'yasnippet)
     (yas/initialize)
     (yas/load-directory "~/.emacs.d/elisp/yasnippet-0.6.1c/snippets")
     ;; auto-complete C++
     (add-to-list 'load-path "~/.emacs.d/elisp/auto-complete-clang")
     (require 'auto-complete-clang)
     (require 'cc-mode)
     (define-key c++-mode-map (kbd "M-TAB") 'ac-complete-clang)
;; semantic
     (require 'semantic)
     (add-hook 'c-mode-hook
	       '(lambda ()
		  (semantic-mode)
		  ;; ac-omni-completion-sources is made buffer local so
		  ;; you need to add it to a mode hook to activate on
		  ;; whatever buffer you want to use it with.  This
		  ;; example uses C mode (as you probably surmised).
		  ;; auto-complete.el expects ac-omni-completion-sources to be
		  ;; a list of cons cells where each cell's car is a regex
		  ;; that describes the syntactical bits you want AutoComplete
		  ;; to be aware of. The cdr of each cell is the source that will
		  ;; supply the completion data.  The following tells autocomplete
		  ;; to begin completion when you type in a . or a ->
		  (add-to-list 'ac-omni-completion-sources
			       (cons "\\." '(ac-source-semantic)))
		  (add-to-list 'ac-omni-completion-sources
			       (cons "->" '(ac-source-semantic)))
		  ;; ac-sources was also made buffer local in new versions of
		  ;; autocomplete.  In my case, I want AutoComplete to use
		  ;; semantic and yasnippet (order matters, if reversed snippets
		  ;; will appear before semantic tag completions).
		  (setq ac-sources (append '(ac-source-semantic) ac-sources))
		  ))
;; Load Flymake
    ;; (require 'flymake)
    ;; ;; RÃ¨gle Ã  ajouter dans le Makefile du projet pour lancer Flymake
    ;; ;; En C
    ;; ;; check-syntax:
    ;; ;;      gcc $(CFLAGS) -fsyntax-only $(CHK_SOURCES)
    ;; ;; En C++
    ;; ;; check-syntax:
    ;; ;;      g++ $(CXX_FLAGS) -fsyntax-only $(CHK_SOURCES)

    ;; ;; Pour que Flymake accepte de se lancer dans les fichier .hpp et .hh
    ;; (push '("\\.hpp\\'" flymake-simple-make-init) flymake-allowed-file-name-masks)
    ;; (push '("\\.hh\\'" flymake-simple-make-init) flymake-allowed-file-name-masks)

    ;; ;; Switcher Flymake facilement avec Alt + Enter
    ;; (global-set-key (kbd "M-RET") 'flymake-mode)

    ;; Erreurs Flymake dans le minibuffer
    ;; (defun flymake-show-help-in-minibuffer ()
    ;;   (when (get-char-property (point) 'flymake-overlay)
    ;;	(let ((help (get-char-property (point) 'help-echo)))
    ;;	  (if help (message "%s" help))))
    ;;   )
    ;; (add-hook 'post-command-hook 'flymake-show-help-in-minibuffer)

    ;; ;; Miscellaneous keys for compilation
    ;; ;; Si Flymake est activÃ© alors M-n/M-p permettent d'aller d'une erreur
    ;; ;; Ã  l'autre, sinon ces touches servent Ã  aller d'une erreur Ã  l'autre
    ;; ;; de la sortie d'un M-x compile.
    ;; (define-key c-mode-base-map (kbd "M-n") '(lambda ()
    ;;					       (interactive)
    ;;					       (if flymake-mode
    ;;						   (flymake-goto-next-error)
    ;;						 (next-error))
    ;;					       ))
    ;; (define-key c-mode-base-map (kbd "M-p") '(lambda ()
    ;;					       (interactive)
    ;;					       (if flymake-mode
    ;;						   (flymake-goto-prev-error)
    ;;						 (previous-error))
    ;;					       ))
    ;; (define-key c-mode-base-map (kbd "C-c c") '(lambda ()
    ;;						 (interactive)
    ;;						 (save-buffer 0)
    ;;						 (compile "make -k re")
    ;;						 ))
;; Make window switching a little easier. C-x-o is a pain.
    ;; Easy window switching with M-x windmove-{left,right,down,up} RET
    ;; (windmove-default-keybindings 'meta) (meta, control, shift)
    (windmove-default-keybindings)          ; Shit + arrows (by default)
;; Fix XTerm S-<up>
    (global-set-key [select] 'windmove-up)
;; Auto-insert Stuff
    (setq auto-insert-directory "~/.emacs.d/insert/")
    ;; If you don't want to be prompted before insertion
    (setq-default auto-insert-query nil)
    ;; List of associated file with extension
    (setq auto-insert-alist
	  '(
	    ;; extension    . ["filename-to-insert" insertion-function]
	    ("\\.c$"    . ["insert.c" std-file-header])
	    ("\\.h$"    . ["insert.h" h-file-header])
	    ("\\.hh$"   . ["insert.h" h-file-header])
	    ("\\.hpp$"  . ["insert.h" h-file-header])
	    ("\\.cpp$"  . ["insert.cpp" std-file-header])
	    ))

    ;; This function create a basic header file (*.h)
    (defun h-file-header ()
      (std-file-header)
      (newline)
      (insert "once")
      (yas/expand)
      )
    ;; BOCAL STAFF 2010-2011
    ;; FEDORA DUMP

    (load "~/.emacs.d/.std.el")
    (load "~/.emacs.d/.StdComment.el")
    (load "~/.emacs.d/tuareg.el")

    (if (file-exists-p "~/.myemacs")
	(load-file "~/.myemacs"))
    ; EOF

    ;; Do not display a startup screen
    (setq inhibit-startup-screen t)

    ;; Print column number on the mode-line
    (column-number-mode 1)

    ;; Navigation dans les buffers amÃ©liorÃ©es avec C-x b
    (iswitchb-mode 1)
    ;; Iswitchb with Arrow-keys
    (defun iswitchb-local-keys ()
      (mapc (lambda (K)
	      (let* ((key (car K)) (fun (cdr K)))
		(define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	    '(("<right>" . iswitchb-next-match)
	      ("<left>"  . iswitchb-prev-match)
	      ;; ("<up>"    . ignore             )
	      ;; ("<down>"  . ignore             )
	      )))
    (add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

    ;; C-<end> sur rxvt-unicode est buggÃ©, il est interprÃ©tÃ© comme Ã©tant
    ;; <clearline>
    (global-set-key [clearline] 'end-of-buffer)

    ;; Petites amÃ©liorations de Yasnippet
    ;; Fix the promp on X, the default was ugly.
    (setq yas/prompt-functions '(yas/dropdown-prompt
				 yas/ido-prompt
				 yas/completing-prompt
				 yas/ido-prompt
				 yas/no-prompt))

    ;; from here: https://github.com/blastura/dot-emacs/blob/master/init.el
    (add-hook 'yas/after-exit-snippet-hook
	      '(lambda ()
		 (indent-region yas/snippet-beg
				yas/snippet-end)))
;; Thanks http://www.emacswiki.org/emacs/JonathanArnoldDotEmacs
    ;; note: Slash for directory
    (setq completion-ignored-extensions '(".o"
					  ".elc"
					  "~"
					  ".git/"
					  ".svn/"))

    ;; Paste at cursor position
    (setq mouse-yank-at-point t)


    (require 'paren)
    ;;(set-face-background 'show-paren-match-face "blue")
    ;;(set-face-foreground 'show-paren-match-face "white")
    ;;(set-face-attribute 'show-paren-match-face nil :weight 'extra-bold)

    ;; Show the matching parenthesis
    (show-paren-mode 1)

    ;; Replace selection
    (delete-selection-mode 1)

    ;; Enable that causes the Compilation mode commands to put point at the
    ;; end of their output window so that the end of the output is always
    ;; visible rather than the beginning.
    (setq compilation-scroll-output t)

    ;; C-k kills whole line and newline if at beginning of line
    (setq kill-whole-line t)

    ;; Oh god, I didn't know this one before, shame on me :(
    (setq-default show-trailing-whitespace t)

    ;; Red is really annoying
    (set-face-background 'trailing-whitespace "gray25")

    ;; Display specific mode colors in src block
    (setq-default org-src-fontify-natively t)

    ;; Turn on Auto Fill mode for Text mode

    (add-hook 'text-mode-hook 'turn-on-auto-fill)
    ;; Org-mode

    (require 'org-install)
    (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
    (define-key global-map "\C-cl" 'org-store-link)
    (define-key global-map "\C-ca" 'org-agenda)
    (setq org-log-done t)

    ;; Fin Org-mode

    (global-linum-mode 1)
    (setq linum-format "%3d. ")
    (setq column-number-mode t)

    (setq-default truncate-lines 1)

    ;; Recherche dans tous les fichiers
    (global-set-key (kbd "C-c s") 'find-grep)

    ;; Cacher ou non les blocs
    (add-hook 'c-mode-hook 'outline-minor-mode)
    (global-set-key [f5] 'hs-hide-block)
    (global-set-key [f6] 'hs-show-block)
    (global-set-key [f7] 'hs-minor-mode)

    (normal-erase-is-backspace-mode -1)


(add-to-list 'load-path "~/.emacs.d/elisp/doxymacs")
(require 'doxymacs)
(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
(add-hook 'c-mode-common-hook'doxymacs-mode)


    ;(add-to-list 'auto-mode-alist '("\\.cws$" . javascript-mode))
    ;(add-to-list 'auto-mode-alist '("\\.jst\\.ejs$" . html-mode))

;;(setq load-path (cons "~/.emacs.d/emacs-rails" load-path))
;;(require 'rails)

;;x(add-to-list 'load-path "~/.emacs.d/elisp/nxhtml")
;;(load "~/.emacs.d/elisp/nxhtml/autostart")

;; nuke whitespaces when writing to a file
;(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jst.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jst\\'" . web-mode))

(setq web-mode-engines-alist
      '(("php"          . "\\.phtml\\'")
        ("blade"        . "\\.blade\\.")
        ("erb"          . "\\.erb\\.")
        ("underscorejs" . "\\.jst\\."))
)


;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)

(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/"))
;; Add the user-contributed repository
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))
;; Add the MELPA
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)


(require 'hlinum)                       ; TODO custom colors

(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

(require 'rvm)
(rvm-use-default)

;;(require 'command-stats)
;;(require 'command-frequrequire 'cppcheck)
(require 'cpputils-cmake)
(require 'flymake)

(require 'flymake-cursor)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(csv-separators (quote ("," "	" ";")))
 '(custom-safe-themes
   (quote
    ("0155b3b94f6d5bce0275a15bc662be4f6f9f3284f9e469ca4ab1bd67ff9b5222" default)))
 '(display-time-default-load-average nil)
 '(display-time-mail-directory nil)
 '(display-time-mail-string "")
 '(display-time-mode t)
 '(flymake-cppcheck-enable "all")
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.9)
 '(js2-basic-offset 4)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (web-mode php-mode auto-org-md yaml-mode use-package textmate-to-yas rvm rustfmt ruby-tools ruby-test-mode ruby-hash-syntax ruby-end ruby-compilation ruby-block rspec-mode restclient racer planet-theme multiple-cursors move-text markdown-preview-mode jump json-mode hlinum go-guru go-errcheck go-complete go-autocomplete flymd flymake-ruby flymake-json flymake-jslint flymake-d flymake-cursor flymake-csslint flymake-css flymake-cppcheck flymake-checkers flycheck exec-path-from-shell env-var-import enh-ruby-mode emacsql-mysql dockerfile-mode ctags-update ctags csv-mode cpputils-cmake cppcheck command-stats command-frequency cmake-project cmake-mode cargo ac-js2)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tool-bar-position (quote bottom))
 '(tooltip-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(uniquify-min-dir-content 1))

(require 'flymake-checkers)
;;(flymake-checkers-mode-on)
(flymake-mode-on)
;;(flymake-js-check-rhino-js)

(require 'flymake-css)
(require 'flymake-csslint)
(require 'flymake-easy)
;;(require 'flymake-jslint)

(require 'flymake-ruby)

(require 'go-mode)
(require 'hlinum)
(require 'json-mode)
(require 'move-text)
(move-text-default-bindings)

(require 'multiple-cursors) ;; F**ked !!!
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-,") 'mc/mark-all-like-this)

(require 'rspec-mode)

;; Ruby block
(require 'ruby-block)
(ruby-block-mode t)
;; do overlay
;;(setq ruby-block-highlight-toggle 'overlay)
;; display to minibuffer
;;(setq ruby-block-highlight-toggle 'minibuffer)
;; display to minibuffer and do overlay
(setq ruby-block-highlight-toggle t)
;; (setq ruby-deep-indent-paren '(?\( ?\[ ?\] t))

(require 'ruby-end)



(add-hook 'ruby-mode-hook
          '(lambda ( )
             (rvm-activate-corresponding-ruby)
             (flymake-ruby-load)
             )
          )


(add-to-list 'auto-mode-alist '(".*_rspec\\.rb\\'" . rspec-mode))
(add-hook 'rspec-mode-hook
          '(lambda ( )
             (rvm-activate-corresponding-ruby)
             (flymake-ruby-load)
             )
          )

(require 'ruby-hash-syntax)
(require 'ruby-test-mode)
(require 'ruby-tools)
(require 'textmate-to-yas)


(require 'js2-mode)
(require 'setup-js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.lod\\'" . js-mode))
(setq js-indent-level 4)

(setq js2-bounce-indent-p t)

;; After js2 has parsed a js file, we look for jslint globals decl comment ("/* global Fred, _, Harry */") and
;; add any symbols to a buffer-local var of acceptable global vars
;; Note that we also support the "symbol: true" way of specifying names via a hack (remove any ":true"
;; to make it look like a plain decl, and any ':false' are left behind so they'll effectively be ignored as
;; you can;t have a symbol called "someName:false"
;; (add-hook 'js2-post-parse-callbacks
;;           (lambda ()
;;             (when (> (buffer-size) 0)
;;               (let ((btext (replace-regexp-in-string
;;                             ": *true" " "
;;                             (replace-regexp-in-string "[\n\t ]+" " " (buffer-substring-no-properties 1 (buffer-size)) t t))))
;;                 (mapc (apply-partially 'add-to-list 'js2-additional-externs)
;;                       (split-string
;;                        (if (string-match "/\\* *global *\\(.*?\\) *\\*/" btext) (match-string-no-properties 1 btext) "")
;;                        " *, *" t))
;;                 ))))



;; (add-hook 'js-mode-hook
;;           '(lambda ( )
;;              ;;(flymake-mode-on)
;;              (flymake-jslint-load)
;;              )
;;           )

;; (add-hook 'js2-mode-hook
;;           '(lambda ( )
;;              ;;(flymake-mode-on)
;;              (flymake-jslint-load)
;;              )
;;           )




;; auto-complete ;; Have to set last because fails somtimes
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)

;; Custom colors
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-error ((t (:background "black" :foreground "red" :weight bold))))
 '(js2-external-variable ((t (:background "black" :foreground "orange" :weight bold))))
 '(markdown-code-face ((t (:inherit default :background "#1e2832")))))






;; Tests
(add-hook 'js2-mode-hook 'ac-js2-mode)

;;(setq load-path (cons (expand-file-name "/dir/with/cmake-mode") load-path))
(require 'cmake-mode)

(require 'ctags)
(setq tags-revert-without-query t)
(global-set-key (kbd "<f8>") 'ctags-create-or-update-tags-table)

;;(require 'ctags-updates)
(add-hook 'c-mode-common-hook  'turn-on-ctags-auto-update-mode)
(autoload 'turn-on-ctags-auto-update-mode "ctags-update" "turn on `ctags-auto-update-mode'." t)


(require 'flymake-cppcheck)
(add-hook 'c-mode-hook 'flymake-cppcheck-load)
(add-hook 'c++-mode-hook 'flymake-cppcheck-load)


(load-theme 'planet t)



;; FULLSCREEN
(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(global-set-key [f11] 'toggle-fullscreen)

(normal-erase-is-backspace-mode 't)

;; Window is resizable
(global-set-key (kbd "s-<down>") 'enlarge-window)
(global-set-key (kbd "s-<up>") 'shrink-window)
(global-set-key (kbd "s-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-<right>") 'shrink-window-horizontally)


;; Prevent auto-insert of # coding: utf-8 on top of ruby files
;; (setq ruby-insert-encoding-magic-comment nil)

(setenv "GOPATH"
        "/home/yberthou/Projects/go")

(use-package go-mode
    :mode "\\*\\.go"
    :config (add-hook 'go-mode-hook
	  (lambda ()
		(flycheck-mode)
		(add-hook 'before-save-hook
				  'gofmt-before-save)
                ;; (setq gofmt-command "goimports")
                (setq exec-path (append exec-path '("/home/yberthou/Projects/go/bin/")))
                )))


(require 'whitespace)
(setq whitespace-line-column 120) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)


;; duplicate line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (yank)
)
(global-set-key (kbd "C-d") 'duplicate-line)

;; Add bash PATH
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
