(package-initialize)

(setq custom-file "~/.emacs.custom.el")
(setq whitespace-style '(face tabs spaces trailing space-before-tab newline indentation
      empty space-after-tab space-mark tab-mark newline-mark
      missing-newline-at-eof))

(load-file "~/.emacs.rc/rc.el")

(add-to-list 'load-path "~/.emacs.local/")
(add-to-list 'default-frame-alist `(font . "Iosevka-20"))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(require 'whitespace)
(global-whitespace-mode 1)
(global-display-line-numbers-mode 1)
(ido-mode 1)
(ido-everywhere 1)

(when (eq system-type 'darwin)
  (add-to-list 'exec-path "/opt/homebrew/bin")
  (setenv "PATH" (concat "/opt/homebrew/bin:" (getenv "PATH"))))

(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(rc/require 'smex)
(rc/require-theme 'gruber-darker)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'smex)

(rc/require
 'robe
 'markdown-mode
 )

(rc/require 'magit)
(setq magit-auto-revert-mode nil)

;;; (global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;;; multiple cursors
(rc/require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
	(line (let ((s (thing-at-point 'line t)))
		(if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'rc/duplicate-line)

(defun sqlcmd-run-current-file ()
  (interactive)
  (let ((default-directory (project-root (project-current t))))
    (compile
     (format
      "sqlcmd -S localhost -U sa -P testing123@@ -i %s"
      (shell-quote-argument buffer-file-name)))))

(global-set-key (kbd "C-S-e") #'sqlcmd-run-current-file)


(load-file custom-file)
