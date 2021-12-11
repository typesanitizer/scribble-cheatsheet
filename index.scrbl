#lang scribble/manual

@(require (for-syntax scribble/core))
@(require scribble/core scribble/decode scribble/html-properties)

@(define (example contents)
   (make-compound-paragraph plain 
       (list (codeblock contents)
             (make-paragraph plain contents))))

@title{Scribble cheatsheet}
@author{Varun Gandhi}

@section{Basic formatting}

@codeblock|{
  Markdown: **Bold text**
  Scribble: @bold{Bold text}
}|
@bold{Bold text}

@codeblock|{
  Markdown: _Italicized text_
  Scribble: @italic{Italicized text}
}|
@italic{Italicized text}

@codeblock|{
  ;; strikethrough doesn't work out-of-the-box
  @(define (strike strs)
      (make-element (make-style "strike" (list (make-alt-tag "s")))
                    (decode-flow strs)))
}|

@codeblock|{
  Markdown: ~~Strikethrough text~~
  Scribble: @strike{Strikethrough text}
}|
@(define (strike strs)
    (make-element (make-style "strike" (list (make-alt-tag "s")))
                  (decode-string strs)))
@strike{Strikethrough text}

@codeblock|{
  ;; blockquotes don't work out-of-the-box
  @(define (blockquote . strs)
       (make-nested-flow (make-style "blockquote" '(command))
                         (decode-flow strs)))
}|
@codeblock|{
  Markdown: > Quoted text
  Scribble: @blockquote{Quoted text}
}|
@(define (blockquote . strs)
     (make-nested-flow (make-style "blockquote" '(command))
                       (decode-flow strs)))
@blockquote{Quoted text}

@section{Inline code and code blocks}

@codeblock|{
  Markdown: `inline_code`
  Scribble: @code{inline_code}
}|
@code{inline_code}

@codeblock|{
  Markdown:
  ```racket
  (write "Hello World!")
  ```
  Scribble: // only Racket is supported
  @codeblock|{
  (write "Hello World!")
  }|
}|
@codeblock|{
(write "Hello World!")
}|

@section{Links and Images}

@codeblock|{
  Markdown: [Internet Archive hyperlink](https://archive.org)
  Scribble: @hyperlink["https://archive.org/"]{Internet Archive hyperlink}
}|
@hyperlink["https://archive.org/"]{Internet Archive hyperlink}

@codeblock|{
  Markdown: ![Racket logo SVG](./racket-logo.svg) // no scaling support
  HTML: <img src="./racket-logo.svg" alt="Racket logo SVG" width="20%">
  Scribble: @image["./racket-logo.svg" #:scale 0.2]{Racket logo SVG}
}|
@image["./racket-logo.svg" #:scale 0.2]{Racket logo scaled SVG}

// TODO: How to link to images using URLs?

@section{Tables}

@codeblock|{
  Markdown: (tables extension)
  | C 1  | C 2  | C 3  |
  |:-----|:----:|-----:|
  | sample text | sample text | sample text |

  Scribble:
  @tabular[#:sep @hspace[1]
           #:column-properties '(left center right)
           #:row-properties '(bottom-border ())
           (list (list @bold{C 1} @bold{C 2} @bold{C 3})
                 (list "sample text"   "sample text" "sample text"))]
}|


@tabular[#:sep @hspace[2]
         #:column-properties '(left center right)
         #:row-properties '(bottom-border ())
         (list (list @bold{C 1} @bold{C 2} @bold{C 3})
               (list "sample text"   "sample text" "sample text"))]

@section{Headings}

@section{Footnotes and margin notes}

@section{Definitions and References}
