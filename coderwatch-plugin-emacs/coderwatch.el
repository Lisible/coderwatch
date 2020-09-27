;;; coderwatch.el --- Allow Coderwatch support for emacs
;; Author: Lisible
;; Created: 27 Sep 2020
;; License: MIT

;;; Commentary:
;; This Emacs plugin allows you to use Emacs with Coderwatch.

;;; Code:

(require 'files)
(locate-dominating-file (buffer-file-name) ".coderwatch")

(define-minor-mode coderwatch-mode
  "Global minor mode for coderwatch"
  nil nil nil
  :require 'coderwatch
  :global t
  :group 'coderwatch
  :after-hook
  (progn
    (cond
     (coderwatch-mode
      (coderwatch-enable))
     (t
      (coderwatch-disable)))))

(defconst coderwatch-project-file-name ".coderwatch")

(defun coderwatch-enable ()
  (message (coderwatch-get-project-file-path)))

(defun coderwatch-disable () ())

(defun coderwatch-get-project-file-path ()
  (concat
   (locate-dominating-file (buffer-file-name) coderwatch-project-file-name)
   coderwatch-project-file-name))

(provide 'coderwatch)
;;; coderwatch.el ends here
