;;; rustls.el --- Emacs integration for the rust language server  -*- lexical-binding: t; -*-

;; Copyright (C) 2016

;; Author: Wilfred Hughes <me@wilfred.me.uk>
;; Keywords: rust
;; Version: 0.1
;; Package-Requires: ((json-rpc "20160427"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Basic integration of Emacs with rustls. Alpha.

;;; Code:

(require 'ht)

(defun rustls--build-request (table)
  (let ((json-encoding-pretty-print t))
    (json-encode table)))

(defvar rustls--dir "/home/wilfred/projects/tiddles/")

;; TODO: explore extending elisp-json-rpc to add pipe support in
;; addition to HTTP.
(defun rustls--init ()
  (rustls--build-request
   (ht
    ("jsonrpc" "2.0")
    ;; TODO: a better value?
    ("id" 1)
    ("method" "initialize")
    ("params"
     (ht ("processId" (emacs-pid))
         ("root-path" rustls--dir)
         ("params" (ht)))))))

(provide 'rustls)
;;; rustls.el ends here
