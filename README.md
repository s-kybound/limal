# hops: a dual language to explore dual language idioms

Dual languages are cool, but underexplored. This is an attempt to explore the abilities of dual languages in a nice way. PLILab @ NUS has explored 2 dual languages, `Mini-Mu` and `moo`. Through `Mini-Mu`, we explore the ergonomics of dual languages, and the importance of finding idioms and syntax to support it. Through `moo`, we explore type systems, including evaluation typing and type continuations. 

I originally intended to have `hops` be a lisp with OCaml semantics, after an internship in Ahrefs (fun!) But the heart of this is pattern matching, which also plays a huge role in dual languages. As such, `hops` will build on dual languages instead, and use the power of lisp to make macros, important in supporting idioms, much easier to make.

But while I love lisp, many don't, and so the goal of `hops` is to be split into `hops llang` and `hops rlang`, where useful syntax in rlang (which has a more traditional format) will be transpiled down into `hops llang` where one can define such macros.
