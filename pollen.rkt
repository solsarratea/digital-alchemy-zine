#lang racket

(require pollen/decode pollen/misc/tutorial txexpr sugar
         pollen/core pollen/tag rackjure rackjure/threading
         yaml racket/date pollen/pagetree)

#| VARIABLES|#
(define essence (file->yaml "essence.yaml"))
(define assets-path "aesthetic/assets/")

(define title ("title" essence))
(define subtitle ("subtitle" essence))
(define description ("description" essence))

(define (get-cses attr)
  ;; get classes from attr if they exist, otherwise return an empty string.
  ;; we use this so we can later merge existing classes with this list.
  (let ([class (filter (lambda (v) (eq? 'class (car v))) attr)])
    (cond
      [(null? class) ""]
      [else (cadar class)])))

(define (get-attr attrs attr)
;; given symbol name of attr, return the attr pair from our list of attrs"
(let ([attr-pair (filter (λ (v) (eq? attr (car v))) attrs)])
  (cond
    [(null? attr-pair) '()]
    [else (car attr-pair)])))

(define (get-attrs-sans attrs sans)
  ;; given a list of attributes, and a list of attributes to exclude, return a list of attributes sans the exclusions
  (filter (λ (v) (not (member (car v) sans))) attrs))

(define (get-id attr)
  ;; get id from attributes, to be applied into a tag function later.
  (filter (lambda (v) (eq? 'id (car v))) attr))

(define (ext-link href . text)
  `(a ((href ,href)
       (target "_blank")
       (rel "noreferrer nofollower"))
      ,@text))

(define (source . text)
  `(section ((class "source rainbow"))
        (div ((class "paper"))
        (pre () ,@text))))

;; This is taken from the pollen-tfl/pollen module, available through raco,
;; but I realized we only wanted this single function, so we are placing it here.
(define (detect-list-items elems)
  ;; look for three line breaks between elements, indicating they should be treated as a list instead of multiple p tags.
  (define elems-merged (merge-newlines elems))
  (define (list-item-break? elem)
    (define list-item-separator-pattern (regexp "\n\n\n+"))
    (and (string? elem) (regexp-match list-item-separator-pattern elem)))
  (define list-of-li-elems (filter-split elems-merged list-item-break?))
  (define list-of-li-paragraphs
    (map (λ(li) (decode-paragraphs li #:force? #t)) list-of-li-elems))
  (define li-tag (default-tag-function 'li))
  (map (λ(lip) (apply li-tag lip)) list-of-li-paragraphs))


(define-tag-function (bulleted-list attrs elems)
  `(ul ,@(detect-list-items elems)))

;;;;
;; fig
;;;;
(define-tag-function (fig attrs src)
  ;; returns a figure tag where image is the src.
  ;; if #:caption is provided, will add it as a figcaption
  ;; if #:alt is provided, but #:caption is not, then alt will be added to image.
  ;; all other #:attrs (like #:class and #:id) are added as attributes to the <figure> element.
  (let ([src `(src ,(string-append assets-path (car src)))]
        [caption (get-attr attrs 'caption)]
        [alt (if (null? (get-attr attrs 'alt))
                 `(alt ,(car src))
                 (get-attr attrs 'alt))]
        [fig-attrs (get-attrs-sans attrs '(alt caption))])
    (if (null? caption)
        `(figure ,fig-attrs (img (,alt ,src)))
        `(figure ,fig-attrs (img (,src)) (figcaption ,(cadr caption))))))

(define (toc)
  ;;generate table of contents using the pagenodes created by index.ptree
  (let ((pagetree-list (pagetree->list (get-pagetree "index.ptree"))))
  (txexpr
   'ul
   '((class "table-of-contents"))
   (map (λ (pn)
          (let* ([chapter-title (select-from-metas 'title pn)]
                 [chapter-number (number->string (index-of pagetree-list pn))]
                 [wc (string-length chapter-title)]
                 [listing (string-join
                           (list
                            (if (= 1 (string-length chapter-number))
                                   (string-append "0" chapter-number)
                                   chapter-number)
                           (make-string (- 48 wc) #\.)
                           chapter-title)
                           "")])
            `(li
              (a ((href ,(symbol->string pn)))
                        ,chapter-title)
              (a ((href ,(symbol->string pn)))
                 ,(if (= 1 (string-length chapter-number))
                      (string-append "0" chapter-number)
                      chapter-number)
                 ))))

        pagetree-list))))

(define (tag t)
  `(a((href ,(format "https://mdn.io/~a" t))
      (class "tag")
      (target "_blank")
      (rel "noreferrer noopener")
      (title "see mozilla docs for this tag"))
     (code () ,(format "<~a>" t))))

(define (hardwrapped-grafs xs)
  (define (newline-to-space xs)
    (decode-linebreaks xs " "))
  (decode-paragraphs xs #:linebreak-proc newline-to-space))

(define-syntax (for/s stx)
  ;; from joel dueck, simpler way to do a for/splice.
  (syntax-case stx ()
    [(_ thing listofthings result-expr ...)
     #'(for/splice ([thing (in-list listofthings)]) result-expr ...)]))

(define (root . elements)
  (txexpr 'article empty ( decode-elements elements
                                           #:exclude-tags '(pre code)
                                           #:txexpr-elements-proc hardwrapped-grafs
                                           #:string-proc (compose1 smart-quotes smart-dashes))))

(provide (all-defined-out))

(define items (default-tag-function 'div 'ul))
(define item (default-tag-function 'li 'p))
(define (link url text) `(a ((href ,url)) ,text))
(define section (default-tag-function 'h2))
(define cartelera (default-tag-function 'marquee))
(define cartelera-texto (default-tag-function 'span))

(define container (default-tag-function 'div))
