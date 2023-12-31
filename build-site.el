;; Load the publishing system
(require 'ox-publish)

;; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
                org-html-head "<link rel=\'stylesheet\' href=\'https://org-blog.pages.dev/static/css/simple.css\' />")

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "org_blog"
             :recursive t
             :base-directory "./content"
             :publishing-directory "./public"
             :with-author t             ;; Don't include author name
             :with-creator t            ;; Include Emacs and Org versions in footer
             :with-toc nil              ;; Include a table of contents
             :section-numbers nil       ;; Don't include section numbers
             :time-stamp-file nil       ;; Don't include time stamp in file
             :publishing-function 'org-html-publish-to-html)
       (list "org_attachments"
             :base-directory "./static/"
             :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
             :publishing-directory "./public/static/"
             :recursive t
             :publishing-function 'org-publish-attachment)))

;; Generate the site output
(org-publish-all t)

(message "Build complete")
