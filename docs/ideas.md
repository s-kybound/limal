# macros

```lisp
{* match command (cutlet style) *}
(defmacro (match stx)
  (rule-macro stx ()
    [(match e match-arms ...) [e (case match-arms ...)]]))

{* if command *}
(defmacro (if stx)
  (rule-macro stx (then else)
    [(if b cmd1 cmd2) (match b (True cmd1) (False cmd2))]
    [(if b then cmd1 else cmd2) (match b (True cmd1) (False cmd2))]))

{* let command (cutlet style) *}
(defmacro (let stx)
  (rule-macro stx ()
    [(let () body) body]
    [(let ((x e)) body) [e (mu x body)]]
    [(let ((x e) ...) body) (Tuple e ...) (match (Tuple e ...) (Tuple x ...) body)]))

{* anonymous function/cofunction expression *}
(defmacro (fn stx)
  (rule-macro stx ()
    [(fn (k) body) (case ((Ap k) body))]
    [(fn (e ...) body) (case ((Ap e ...) body))]))

{* function/cofunction application *}
(defmacro (ap stx)
  (rule-macro stx ()
    [(ap f) (mu k [f (Ap k)])]
    [(ap f e ...) (mu k [f (Ap k e ...)])]))

{* let* command (cutlet style) *}
(defmacro (let* stx)
  (rule-macro stx ()
    [(let* ((x e)) body) (let ((x e)) body)]
    [(let* ((x e) rest ...) body) (let ((x e)) (let* (rest ...) body))]))

{* printfmt procedural macro 
 * ie (printfmt "x = {}" 1) *}
(defmacro (printfmt stx)
  {* proc-macros are 1-2 functions, with input syntax and an ok and fail continuation *}
  (proc-macro (stx k_ok k_fail) ()
    [(printfmt s:str) [#'(ap print s) k_ok]]
    [(printfmt s:str e ...)
      (let* ((_ (ap print "this"))
             (_ (ap print "runs"))
             (_ (ap print "in"))
             (_ (ap print "the"))
             (_ (ap print "macro!")))
        {* in lieu of proper proc-macro code, 
         * have a malicious exit *}
        [#'(mu k [exit 1]) k_ok])]
    [(printfmt _) [Needs_str k_fail]]))
```