;;; init.el --- Emacs configurations
;;; Commentary:
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(wombat))
 '(display-line-numbers t)
 '(electric-indent-mode t)
 '(global-flycheck-mode t)
 '(package-selected-packages
   '(cmake-project git-gutter diff-hl markdown-mode mmm-mode flymd yasnippet-snippets smartparens yasnippet company-irony flycheck-irony irony-eldoc irony))
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "SF Mono" :foundry "APPL" :slant normal :weight normal :height 98 :width normal)))))



(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)



(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


(add-hook 'irony-mode-hook #'irony-eldoc)
(add-hook 'irony-mode-hook #'smartparens-mode)

(add-hook 'after-init-hook 'global-company-mode)

(defvar company-backends)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(add-hook 'python-mode #'yas-minor-mode)
(add-hook 'irony-mode-hook #'yas-minor-mode)

(autoload 'cmake-project-mode "cmake-project" nil t)
(defun maybe-cmake-project-mode ()
  (if (or (file-exists-p "CMakeLists.txt")
          (file-exists-p (expand-file-name "CMakeLists.txt" (car (project-roots (project-current))))))
      (cmake-project-mode)))

(add-hook 'c-mode-hook 'maybe-cmake-project-mode)
(add-hook 'c++-mode-hook 'maybe-cmake-project-mode)


(global-git-gutter-mode +1)

(require 'mmm-mode)
(setq mmm-global-mode 'maybe)

(mmm-add-classes
 '((markdown-lisp
    :submode lisp-mode
    :front "^```lisp[\n\r]+"
    :back "^```$")))

(mmm-add-mode-ext-class 'markdown-mode nil 'markdown-lisp)

(provide 'init)
;;; init.el ends here
