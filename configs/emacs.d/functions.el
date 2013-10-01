(defun open-next-line (arg)
      "Move to the next line and then opens a line."
      (interactive "p")
      (end-of-line)
      (open-line arg)
      (next-line 1))

(defun open-previous-line (arg)
      "Move to the previous line and then opens a line."
      (interactive "p")
      (beginning-of-line)
      (open-line arg))

(provide 'functions)
