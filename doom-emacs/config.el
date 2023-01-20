;; (require 'dap-cpptools)

(setq user-full-name "Renat Klindzhev"
      user-mail-address "klindzhev@gmail.com")

(setq doom-theme 'doom-challenger-deep)

(setq display-line-numbers-type t)

(setq org-directory "~/org/")


(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq company-lsp-cache-candidates 'auto)
;; (add-to-list 'load-path "/home/rinux/lsp-bridge")
(setq text-quoting-style 'grave)
;; (require 'yasnippet)
;; (yas-global-mode 1)

;; (require 'lsp-bridge)
;; (global-lsp-bridge-mode)

;; (unless (display-graphic-p)
;;   (add-to-list 'load-path "/home/rinux/acm-terminal")
;;   (with-eval-after-load 'acm
;;     (require 'acm-terminal)))

(use-package! protobuf-mode
  :defer-incrementally t)

;; (add-hook 'lsp-mode-hook 'lsp-ui-doc-mode)
(after! lsp-mode
  (setq lsp-idle-delay 3
        lsp-log-io nil
        gc-cons-threshold (* 1024 1024 100)
        read-process-output-max (* 1024 1024))) ;; 100MiB



;; (map! :leader
;;       :desc "open full documentation"
;;       "z a" #'lsp-rust-analyzer-open-external-docs)

;; (map! :leader
;;       :desc "open doc popup"
;;       "z s" #'lsp-bridge-popup-documentation)


;; (map! :leader
;;       :desc "up doc popup"
;;       "z k" #'lsp-bridge-popup-documentation-scroll-up)


;; (map! :leader
;;       :desc "up doc popup"
;;       "z j" #'lsp-bridge-popup-documentation-scroll-down)

;; (setq lsp-bridge-enable-debug t)


;; (setq global-company-mode nil)                  ;


;; (add-hook 'doom-init-modules-hook
;;           (lambda ()
;;             (after! lsp-mode
;;               (setq lsp-completion-provider :none))))

;; ;; Pad before lsp modeline error info
;; (add-hook 'lsp-mode-hook
;;           (lambda ()
;;             (setf (caadr
;;                    (assq 'global-mode-string mode-line-misc-info))
;;                   " ")))

;; ;; Set orderless filtering for LSP-mode completions
;; (add-hook 'lsp-completion-mode-hook
;;           (lambda ()
;;             (setf (alist-get 'lsp-capf completion-category-defaults) '((styles . (orderless))))))

;; Set bindings
;; (map! :i "C-@" #'completion-at-point
;;       :i "C-SPC" #'completion-at-point
;;       (:prefix "C-x"
;;        :i "C-k" #'cape-dict
;;        :i "C-f" #'cape-file
;;        :i "s" #'cape-ispell
;;        :i "C-n" #'cape-keyword
;;        :i "C-s" #'dabbrev-completion))

;; Fallback cleanly to consult in TUI
;; (setq-default completion-in-region-function #'consult-completion-in-region)

;; (use-package corfu
;;   :custom
;;   (corfu-separator ?\s)          ;; Orderless field separator
;;   (corfu-preview-current nil)    ;; Disable current candidate preview
;;   (corfu-auto nil)
;;   (corfu-on-exact-match nil)
;;   (corfu-quit-no-match 'separator)
;;   (corfu-preselect-first nil)
;;   :hook
;;   (doom-first-buffer . global-corfu-mode)
;;   :bind (:map corfu-map
;;          ("SPC" . corfu-insert-separator)
;;          ("TAB" . corfu-next)
;;          ([tab] . corfu-next)
;;          ("S-TAB" . corfu-previous)
;;          ([backtab] . corfu-previous)))

;; (use-package corfu-doc
;;   :hook
;;   (corfu-mode . corfu-doc-mode)
;;   :bind (:map corfu-map
;;          ("M-n" . corfu-doc-scroll-down)
;;          ("M-p" . corfu-doc-scroll-up)
;;          ("M-d" . corfu-doc-toggle)))

;; (use-package orderless
;;   :when (featurep! +orderless)
;;   :init
;;   (setq completion-styles '(orderless)
;;         completion-category-defaults nil
;;         completion-category-overrides '((file (styles . (partial-completion))))))

;; (use-package kind-icon
;;   :after corfu
;;   :custom
;;   (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
;;   :config
;;   (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

;; (use-package cape
;;   :defer t
;;   :init
;;   (add-to-list 'completion-at-point-functions #'cape-file-capf)
;;   (add-to-list 'completion-at-point-functions #'cape-dabbrev-capf)
;;   (add-to-list 'completion-at-point-functions #'cape-keyword-capf))

;; (setq completion-cycle-threshold 1)     ;

;; Enable indentation+completion using the TAB key.
;; Completion is often bound to M-TAB.
(setq tab-always-indent 'complete)

;; Dirty hack to get c completion running
;; Discussion in https://github.com/minad/corfu/issues/34
;; (when (equal tab-always-indent 'complete)
;;   (map! :map c-mode-base-map
;;         :i [remap c-indent-line-or-region] #'completion-at-point))

(use-package lsp-ui
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (setq lsp-ui-sideline-enable t
        lsp-ui-doc-enable t
        lsp-ui-doc-use-webkit nil
        lsp-ui-doc-delay 0.2
        lsp-ui-doc-include-signature t
        lsp-ui-doc-enable t
        lsp-ui-doc-mode t
        lsp-ui-doc-max-height 50
        lsp-ui-doc-position 'bottom
        lsp-ui-flycheck-enable t
        lsp-ui-imenu-enable t
        lsp-ui-imenu t
        lsp-ui-sideline-ignore-duplicate t))

  (map! :leader
        :desc "Code mini description"
        "z s" #'lsp-ui-doc-show)


(after! lsp-ui
  (map! :leader
        :desc "Code Outline"
        "z d" #'lsp-ui-imenu))

  (map! :leader
        :desc "Code mini description"
        "z h" #'lsp-ui-doc-hide)

(map! :leader
     :desc "Focus to mini doc window"
     "z f" #'lsp-ui-doc-focus-frame)


(defun lsp-ui-doc-show-and-focus-command ()
  "Command to show and focus the lsp-ui-doc frame."
  (interactive)
  (lsp-ui-doc-show-and-focus))

(defun lsp-ui-doc-show-and-focus ()
  "Show the lsp-ui-doc frame and focus it after a short delay."
  (lsp-ui-doc-show)
  (run-at-time 0.1 nil #'lsp-ui-doc-focus-frame))


(after! dap-cpptools
  (dap-register-debug-template "Rust::CppTools Run Configuration"
                               (list :type "cppdbg"
                                     :request "launch"
                                     :name "Rust::Run"
                                     :MIMode "gdb"
                                     :miDebuggerPath "rust-gdb"
                                     :environment []
                                     :program "${workspaceFolder}/target/debug/hello / replace with binary"
                                     :cwd "${workspaceFolder}"
                                     :console "external"
                                     :dap-compilation "cargo build"
                                     :dap-compilation-dir "${workspaceFolder}")))

(after! dap-mode
  (setq dap-default-terminal-kind "integrated")
  (dap-auto-configure-mode +1))
(setq acm-enable-tabnine nil)
(setq centaur-tabs-enable-key-bindings t)
(setq lsp-rust-analyzer-cargo-run-build-scripts t)
(setq lsp-rust-analyzer-display-chaining-hints t)
(setq lsp-rust-analyzer-display-closure-return-type-hints t)
(setq lsp-rust-analyzer-display-lifetime-elision-hints-enable "always")
(setq lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names t)
(setq lsp-rust-analyzer-display-parameter-hints t)
(setq lsp-rust-analyzer-display-reborrow-hints t)
(setq lsp-rust-analyzer-experimental-proc-attr-macros t)
(setq lsp-rust-analyzer-inlay-face 'lsp-face-semhl-label)
(setq lsp-rust-analyzer-macro-expansion-method 'dia/rust-analyzer-macro-expand)
(setq lsp-rust-analyzer-proc-macro-enable t)
(setq lsp-rust-analyzer-rustfmt-extra-args [])
(setq lsp-rust-analyzer-rustfmt-override-command ["rustup run stable rustfmt"])
(setq lsp-rust-analyzer-server-display-inlay-hints t)
(setq lsp-rust-unstable-features t)
