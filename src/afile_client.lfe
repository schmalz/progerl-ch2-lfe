(defmodule afile_client
  (export (ls 1)
          (get-file 2)))

(defun ls (server)
  (! server (tuple (self) 'list_dir))
  (receive
    ((tuple server file-list)
     file-list)))

(defun get-file (server file)
  (! server (tuple (self) (tuple 'get_file file)))
  (receive
    ((tuple server content)
     content)))