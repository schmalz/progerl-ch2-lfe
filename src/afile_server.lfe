(defmodule afile_server
  (export (start 1)
          (loop 1)))

(defun start (dir)
  (spawn 'afile_server 'loop (list dir)))

(defun loop (dir)
  (receive
    ((tuple from 'list_dir)
     (! from (tuple (self) (file:list_dir dir))))
    ((tuple from (tuple 'get_file file))
     (! from (tuple (self) (file:read_file (filename:join dir file))))))
  (loop dir))