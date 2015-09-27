#|
 This file is a part of autobuild
 (c) 2015 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:org.shirakumo.autobuild)

(defun format-date (&optional (universal-time (get-universal-time)))
  (multiple-value-bind (s m h dd mm yy) (decode-universal-time universal-time)
    (format NIL "~d.~d.~d ~2,'0d:~2,'0d:~2,'0d"
            yy mm dd h m s)))

(defun format-time (seconds)
  (let ((s (mod seconds 60))
        (m (floor (mod (/ seconds 60) 60)))
        (h (floor (/ seconds (* 60 60)))))
    (format NIL "~:[~d hour~:p~;~*~]~:[ ~d minute~:p~;~*~]~:[ ~d second~:p~;~*~]"
            (= 0 h) h (= 0 m) m (= 0 s) s)))
