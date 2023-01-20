(package! prisma-mode :recipe (:host github :repo "pimeys/emacs-prisma-mode" :branch "main"))
;; (package! posframe)
;; (package! markdown-mode)
;; (package! popon)
;; (package! yasnippet)
;; (package! corfu :pin "9c9be9c5709066adeaab1a4ddbe0956802351807")
;; (when (featurep! +orderless)
;;   (package! orderless :pin "87ab7e47e343285f7afd42779c78551332b8fd84"))
;; (package! kind-icon :pin "8ac781a8f51a424548a786f77a1083365c58ab28")
;; (package! cape :recipe (:host github :repo "minad/cape" :branch "main"))
;; (package! corfu-doc :recipe (:host github :repo "galeo/corfu-doc" :branch "main"))

(package! protobuf-mode
  :recipe (:host github :repo "protocolbuffers/protobuf"
           :files ("editors/protobuf-mode.el")))
