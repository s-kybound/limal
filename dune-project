(lang dune 3.20)

(name hops)
(version 0.0.1)

(generate_opam_files true)

(using menhir 3.0)

(source
 (github s-kybound/hops))

(authors "Kyriel Abad <abadkyriel@gmail.com>")

(package
 (name hops)
 (synopsis "A typed dual language to explore ergonomics and idioms")
 (description "A typed dual language to explore sequent-calculus based programming")
 (depends ocaml cmdliner dune-build-info linenoise menhir)
 (tags
  ("duality" "continuations")))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
