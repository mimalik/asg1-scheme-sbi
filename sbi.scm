#!/afs/cats.ucsc.edu/courses/cmps112-wm/usr/racket/bin/mzscheme -qr
;; $Id: sbi.scm,v 1.4 2018-04-11 16:31:36-07 - - $
;;
;; NAME
;;    sbi.scm - silly basic interpreter
;;
;; SYNOPSIS
;;    sbi.scm filename.sbir
;;
;; DESCRIPTION
;;    The file mentioned in argv[1] is read and assumed to be an SBIR
;;    program, which is the executed.  Currently it is only printed.
;;

(define *stdin* (current-input-port))
(define *stdout* (current-output-port))
(define *stderr* (current-error-port))

(define *run-file*
    (let-values
        (((dirpath basepath root?)
            (split-path (find-system-path 'run-file))))
        (path->string basepath))
)

(define (die list)
    (for-each (lambda (item) (display item *stderr*)) list)
    (newline *stderr*)
    (exit 1)
)

(define (usage-exit)
    (die `("Usage: " ,*run-file* " filename"))
)

(define (readlist-from-inputfile filename)
    (let ((inputfile (open-input-file filename)))
         (if (not (input-port? inputfile))
             (die `(,*run-file* ": " ,filename ": open failed"))
             (let ((program (read inputfile)))
                  (close-input-port inputfile)
                         program))))

(define (write-program-by-line filename program)
    (printf "==================================================~n")
    (printf "~a: ~s~n" *run-file* filename)
    (printf "==================================================~n")
    (printf "(~n")
    (map (lambda (line) (printf "~s~n" line)) program)
    (printf ")~n"))

(define (main arglist)
    (if (or (null? arglist) (not (null? (cdr arglist))))
        (usage-exit)
        (let* ((sbprogfile (car arglist))
               (program (readlist-from-inputfile sbprogfile)))
<<<<<<< HEAD
              (write-program-by-line sbprogfile program)))
              (interpret-program top program)
)

(for-each
    (lambda (pair)
            (symbol-put! (car pair) (cadr pair)))
    `(

        (/       ,(lambda (x y) (/ (+ x 0.0) (+ y 0.0))))
        (%       ,(lambda (x y) (- x (* (/ x y) y))))
        (+       ,+)
        (^       ,expt)
        (-       ,-)
        (*       ,*)
        (abs    ,abs)
        (acos   ,acos)
        (asin   ,asin)
        (atan   ,atan)
        (ceil   ,ceiling)
        (cos    ,cos)
        (exp    ,exp)
        (floor  ,floor)
        (log    ,log)
        (log10  ,(lambda (x) (/ (log x) (log 10.0))))
        (round  ,round)
        (sin    ,sin)
        (sqrt   ,sqrt)
        (tan    ,tan)
        (trunc  ,truncate)
))
(hash-set! *var-table* "pi"
     3.141592653589793238462643383279502884197169399)
(hash-set! *var-table* "e"
     2.718281828459045235360287471352662497757247093)

(define (interpret-program line-num prog)
  (if (> line-num (length prog))
  (exit 0)
  (void))
  (let ((line (list-ref prog(incr line-num))))
    (if (null? (cdr line))
    (interpret-program (decr line-num) program)
    (void)
  )
    (if (has-label line)
      (let((stmt (caddr line)))
      )
    )

)

=======
              (write-program-by-line sbprogfile program))))
>>>>>>> parent of c7dc466... Trying to add stuff to sbi.scm

(when (terminal-port? *stdin*)
      (main (vector->list (current-command-line-arguments))))
