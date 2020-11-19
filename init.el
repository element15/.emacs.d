(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-electric-left-right-brace t)
 '(LaTeX-indent-environment-list
   '(("verbatim" current-indentation)
	 ("verbatim*" current-indentation)
	 ("filecontents" current-indentation)
	 ("filecontents*" current-indentation)
	 ("tabular" LaTeX-indent-tabular)
	 ("tabular*" LaTeX-indent-tabular)
	 ("array" LaTeX-indent-tabular)
	 ("eqnarray" LaTeX-indent-tabular)
	 ("eqnarray*" LaTeX-indent-tabular)
	 ("displaymath")
	 ("equation")
	 ("equation*")
	 ("picture")
	 ("tabbing")))
 '(TeX-electric-math nil)
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(ispell-program-name "aspell")
 '(matlab-indent-function-body nil)
 '(package-selected-packages
   '(pcre2el markdown-mode smart-tab matlab-mode auctex adaptive-wrap color-theme-modern)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 113 :width normal))))
 '(fixed-pitch ((t (:family "DejaVu Sans Mono"))))
 '(font-latex-italic-face ((t (:inherit italic :foreground "OliveDrab"))))
 '(font-latex-verbatim-face ((t (:inherit nil :foreground "burlywood")))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-list '(markdown-mode smart-tab matlab-mode auctex adaptive-wrap color-theme-modern pcre2el))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(load-theme 'desert t t)
(enable-theme 'desert)

;; The extra width is to account for line numbers displayed in the left gutter
(add-to-list 'default-frame-alist '(width . 85))
(add-to-list 'default-frame-alist '(height . 64))
(setq-default column-number-mode t)

;; Enable BBEdit-esque reverse indent for soft-wrapped lines
(setq-default adaptive-wrap-extra-indent 4)
(add-hook 'visual-line-mode-hook #'adaptive-wrap-prefix-mode)
(global-visual-line-mode +1)

(setq-default completion-ignore-case t)
(setq-default read-file-name-completion-ignore-case t)
(setq-default read-buffer-completion-ignore-case t)

;; Generic tab length
(setq-default tab-width 4)

;; LaTeX Formatting
;; (setq-default LaTeX-indent-level 4)
;; (setq-default LaTeX-item-indent 0)
;; (setq-default TeX-brace-indent-level 4)

;; Preserve open buffers and other state on restart
(setq-default desktop-save-mode 1)
(setq-default savehist-mode 1)

;; Smooth scrolling
(setq-default mouse-wheel-progressive-speed nil)

;; Use Matlab mode instead of Octave mode
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
 (add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
(setq matlab-shell-command "matlab")

;; Enable Smart Tab
(global-smart-tab-mode 1)

;; Markdown Preview
;; (defun markdown-html (buffer)
;;   (princ (with-current-buffer buffer
;;     (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
;;   (current-buffer)))

;; macOS-specific keybind options
(setq-default mac-command-modifier 'control)
(setq-default mac-control-modifier 'meta)
