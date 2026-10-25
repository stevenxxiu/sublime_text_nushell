# SYNTAX TEST "Packages/Nushell/nushell.sublime-syntax"

let b = true and  false
#            ^^^              keyword.operator.nu
#               ^^          - keyword.operator.nu
#                 ^^^^^       constant.language.boolean.false.nu
let b = true andx false
#            ^^^^          - keyword.operator.nu
#                 ^^^^^      constant.language.boolean.false.nu
