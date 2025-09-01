; Forked from https://github.com/nushell/tree-sitter-nu
; Copyright (c) 2019 - 2022 The Nushell Project Developers
; Licensed under the MIT license.

; Changed to follow Zed's documented pattern

(expr_parenthesized ")" @end) @indent
(parameter_bracks "]" @end) @indent
(ctrl_match) @indent

(val_record "}" @end) @indent
(val_list "]" @end) @indent
(val_closure "}" @end) @indent
(val_table "]" @end) @indent

(block "}" @end) @indent
