(set 'auto-license-text-gplv3
  (concat "This program is free software: you can redistribute it and/or modify\n"
          "it under the terms of the GNU General Public License as published by\n"
          "the Free Software Foundation, either version 3 of the License, or\n"
          "(at your option) any later version.\n\n"

          "This program is distributed in the hope that it will be useful,\n"
          "but WITHOUT ANY WARRANTY; without even the implied warranty of\n"
          "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the\n"
          "GNU General Public License for more details.\n\n"

          "You should have received a copy of the GNU General Public License\n"
          "along with this program. If not, see <http://www.gnu.org/licenses/>.\n"
          ))

(defun skeleton-license ()
  "Insert a C++ class definition."
    (let ((from_point (point)))
      (insert (concat "File: " (buffer-name) "\n\n"))
      (comment-region from_point (point)))
    (copyright auto-insert-copyright)
    (let ((from_point (point)))
      (insert (concat "\n\n" auto-license-text-gplv3 "\n"))
      (comment-region from_point (point)))

  )

(defun skeleton-header-guards ()
  "Insert a C++ class definition."
  (let* ((header-include-string (upcase (concat "__" (replace-regexp-in-string "[\s.]" "_" (buffer-name)) "__")))
         (class-name (file-name-sans-extension (buffer-name))))

    (insert (concat "#ifndef " header-include-string "\n"
                    "#define " header-include-string "\n"
                    "\n\n\n"
                    "#endif //" header-include-string "\n"))
    )
  )

(defun ak-auto-complete ()
  (let ((file_ext(file-name-extension (buffer-name))))
    (if (and (<= (buffer-size) 0)
             (or (string= file_ext "h")
                 (string= file_ext "hpp")))
        (progn (skeleton-license)
               (skeleton-header-guards))
    )

    (if (and (<= (buffer-size) 0)
             (or (string= file_ext "c")
                 (string= file_ext "cpp")))
        (progn (skeleton-license))
    )
  )
)
