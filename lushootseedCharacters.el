(defun schwa ()  ;; ə  ə
   (interactive)
   ;;(insert "\u0259")
   (insert (char-from-name "LATIN SMALL LETTER SCHWA"))
   )

(defun rw ()  ;; ʷ
   (interactive)
   (insert "\u02B7")
   )

(defun x-wedge ()  ;; x̌
   (interactive)
   (insert "\u0078")
   (insert "\u030C")
   )

(defun c-wedge ()  ;; č
   (interactive)
   (insert "c")
   (insert "\u030C")
   )

(defun s-wedge ()  ;; š
   (interactive)
   (insert "s")
   (insert "\u030C")
   )


(defun barred-el ()  ;; ɬ
   (interactive)
   (insert "\u026C")
   )

(defun barred-lambda ()  ;;  ƛ̓
   (interactive)
   (insert "\u019B")
   (insert "\u0313")
   )

(defun dot () ;;    •
   (interactive)
   (insert "\u2022")
   )

(defun root () ;;   √
   (interactive)
   (insert "\u221A")
   )


(defun gq ()  ;; ʔ
   (interactive)
   (insert "\u0294")
   )

(defun epsilon ()  ;; ε
   (interactive)
   (insert (char-from-name "GREEK SMALL LETTER EPSILON"))
   )



