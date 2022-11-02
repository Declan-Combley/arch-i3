(DEFINE-CONFIGURATION WEB-BUFFER
  ((DEFAULT-MODES '(EMACS-MODE CERTIFICATE-EXCEPTION-MODE WEB-MODE BASE-MODE))))
(DEFINE-CONFIGURATION BUFFER
  ((DEFAULT-MODES (APPEND '(NYXT::EMACS-MODE) %SLOT-DEFAULT%))))
(define-configuration browser
  ;; This is the hook for window initialization.
  ((window-make-hook
    (hooks:add-hook
     %slot-default%
     (nyxt::make-handler-window
      (lambda (window)
        ;; Status bar hiding.
        ;; Works by setting height of the GTK widget
        ;; that status-bar is rendered in, to 0. Does
        ;; not delete status bar, so you can use
        ;;  (setf (gtk:gtk-widget-size-request (status-container window))
        ;;        (list -1 (height status-buffer))
        ;; and
        ;;  (setf (gtk:gtk-widget-size-request (message-container window))
        ;;        (list -1 (message-buffer-height window))
        ;; to toggle it back on.
        ;;
        ;; I also wouldn't recommend using GTK guts
        ;; of Nyxt in such a way, as it could break
        ;; in horrible ways the moment we change
        ;; these guts. However, there's no way to
        ;; accomplish what you want without hooking
        ;; into Nyxt/GTK guts.
        (setf (gtk:gtk-widget-size-request (status-container window))
              (list -1 0))
        ;; Message area hiding. I don't recommend
        ;; doing it, as you could miss some important
        ;; messages.
        (setf (gtk:gtk-widget-size-request (message-container window))
              (list -1 0)))
      :name 'delete-status-bar-and-message-area)))))

(define-configuration prompt-buffer
  ((style (str:concat
           %slot-default%
           (cl-css:css
            '((body
               :background-color "#181818"
               :color "white")
              ("#prompt-area"
               :background-color "#181818")
              ;; The area you input text in.
              ("#input"
               :background-color "white")
              (".source-name"
               :color "#d09126"
               :background-color "#181818")
              (".source-content"
               :background-color "#181818")
              (".source-content th"
               :border "1px solid #181818"
               :background-color "#181818")
              ;; The currently highlighted option.
              ("#selection"
               :background-color "white"
               :color "#181818")
              (.marked :background-color "#d09126"
                       :font-weight "bold"
                       :color "white")
              (.selected :background-color "#d09126"
                         :color "white")))))))

;;; Panel buffers are the same in regards to style.
(define-configuration (internal-buffer panel-buffer)
  ((style
    (str:concat
     %slot-default%
     (cl-css:css
      '((body
         :background-color "#181818"
         :color "white")
        (hr
         :color "white")
        (a
         :color "white")
        (.button
         :color "white"
         :background-color "#181818")))))))

(define-configuration window
  ((message-buffer-style
    (str:concat
     %slot-default%
     (cl-css:css
      '((body
         :background-color "#181818"
         :color "white")))))))
