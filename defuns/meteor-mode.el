;;; meteor-mode.el --- Provide some niftyness for meteor (an attempt)

;; Copyright © 2014 - Jeroen Tiebout <jeroen@tinktenk.be>

;; Author: Jeroen Tiebout <jeroen@tinktenk.be>
;; URL: https://github.com/tinktenk/meteor-mode
;; Keywords: meteor
;; Version: 0.0.0
;; Package-Requires: 

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;;
;;; Code:

(defcustom meteor-project-root-folder ".meteor"
  "The meteor folder considered to mark the root of a project."
  :group 'meteor-mode
  :type 'string)

(defcustom meteor-enabled-modes
  "A list of major modes that should trigger meteor mode if 'meteor-project-root-folder' is found"
  '("javascript-mode"
  "js2-mode"
  "js3-mode"
  "html-mode"
  "web-mode")
  :group 'meteor-mode
    :type '(repeat-string))

;;; Project root related utilities
(defun meteor-project-root ()
  "Retrieves the root directory of a project if available.
The current directory is assumed to be the project's root otherwise."
  (let ((project-root
         (or (->> meteor-project-root-folder
               (--map (locate-dominating-file (file-truename default-directory) it))
               (-remove #'null)
               (car)
               (meteor-file-truename))
             (if projectile-require-project-root
                 (error "You're not in a meteor project")
               default-directory))))
    project-root))

(defun meteor-folder-truename (file-name)
  "A thin wrapper around `file-truename' that handles nil."
  (when file-name
    (file-truename file-name)))
