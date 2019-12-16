(define-module (opencog pointmem))

(use-modules (opencog sp-config))

(load-extension (string-append opencog-ext-path-point-memory "libpoint_memory") "opencog_ato_pointmem_init")
