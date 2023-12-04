;;; trebuchet.el  -*- lexical-binding: t; -*-

;; Copyright (C) 2023 Stirling Hostetter
;; Author:  Stirling Hostetter <stirlhoss@proton.me>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;  _ 

;;; Code:


(defun file-to-string (file)
  "File to string function"
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)))

(setq int-strings '("0" "1" "2" "3" "4" "5" "6" "7" "8" "9"))
(setq to-sum nil)
(defvar i 0)

(defvar c (file-to-string "input.txt"))
(eval c)

(defun find-matches (characters)
  (cl-do ((i 0 (+ i 1))
       (char (elt characters i)))
      ((equal i (length characters)) nil)
    (if(eq char "\n") (message "end of line"))))
    ;; (cond
    ;;   ((eq char "\n")
    ;;    (message "end of line"))
    ;;   ((member char int-strings)
    ;;    (append '(char) to-sum)))))

(int-strings)

(find-matches c)

(eval to-sum)
