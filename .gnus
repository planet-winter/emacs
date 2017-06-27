
;; Read usenet news and RSS feeds with gwene.org
(setq gnus-select-method '(nntp "news.gwene.org"))

;; don't ask how many emails to download
(setq gnus-large-newsgroup t)

; scoring
(setq gnus-use-scoring t)

;; sort messages by score nd date in reverse order
(setq gnus-thread-sort-functions '((not gnus-thread-sort-by-date)
                                   gnus-thread-sort-by-total-score))

;; columns in summary buffer
(setq gnus-summary-line-format "%i %U%R%d%I%(%[%4L: %-23,23f%]%) %s\n")


