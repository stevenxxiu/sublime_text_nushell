# SYNTAX TEST "Packages/Nushell/nushell.sublime-syntax"
# <- source.nu comment.line.number-sign

##
# Comment
##

# Foo
# <- comment.line.number-sign.nushell
# ^^^ comment.line.nushell

foo # Foo
#   ^ comment.line

$var
# <- variable.language.nushell

##
# Integer
##

let a = 1
#       ^ constant.numeric.integer.nushell
let a = -65535
#       ^^^^^^ constant.numeric.integer.nushell

##
# Operator
##
let a = 3 * (1 + 2)
#         ^ keyword.operator.nushell
#              ^ keyword.operator.nushell

##
# Decimal
##

let a = 9.9999
#       ^^^^^^ constant.numeric.decimal.nushell
let a = +9.9999
#       ^^^^^^ constant.numeric.decimal.nushell
let a = -9.9999
#       ^^^^^^ constant.numeric.decimal.nushell
let a = Infinity
#       ^^^^^^^^ constant.numeric.decimal.nushell
let a = +Infinity
#       ^^^^^^^^^ constant.numeric.decimal.nushell
let a = -Infinity
#       ^^^^^^^^^ constant.numeric.decimal.nushell
let a = NaN
#       ^^^ constant.numeric.decimal.nushell
let a = +NaN
#       ^^^^ constant.numeric.decimal.nushell
let a = -NaN
#       ^^^^ constant.numeric.decimal.nushell

##
# Boolean
##

let a = true
#       ^^^^ constant.language.boolean.true.nushell
let a = false
#       ^^^^ constant.language.boolean.false.nushell

##
# Date
##

let a = 2022-02-02
#       ^^^^^^^^^^ constant.date.nushell
let a = 2022-02-02T14:30:00
#       ^^^^^^^^^^^^^^^^^^^ constant.date.nushell
let a = 2022-02-02T14:30:00+05:00
#       ^^^^^^^^^^^^^^^^^^^^^^^^^ constant.date.nushell

##
# Duration
##

let a = 3.14ns
#       ^^^^^^ constant.duration.nushell
let a = 3.14us
#       ^^^^^^ constant.duration.nushell
let a = 3.14ms
#       ^^^^^^ constant.duration.nushell
let a = 3.14sec
#       ^^^^^^^ constant.duration.nushell
let a = 3.14min
#       ^^^^^^^ constant.duration.nushell
let a = 3.14hr
#       ^^^^^^ constant.duration.nushell
let a = 3.14day
#       ^^^^^^^ constant.duration.nushell
let a = 3.14wk
#       ^^^^^^ constant.duration.nushell

##
# File Size
##

let a = 3.14b
#       ^^^^^ constant.file-size.nushell
let a = 3.14kb
#       ^^^^^^ constant.file-size.nushell
let a = 3.14mb
#       ^^^^^^ constant.file-size.nushell
let a = 3.14gb
#       ^^^^^^ constant.file-size.nushell
let a = 3.14tb
#       ^^^^^^ constant.file-size.nushell
let a = 3.14pb
#       ^^^^^^ constant.file-size.nushell
let a = 3.14eb
#       ^^^^^^ constant.file-size.nushell
let a = 3.14zb
#       ^^^^^^ constant.file-size.nushell
let a = 3.14kib
#       ^^^^^^^ constant.file-size.nushell
let a = 3.14mib
#       ^^^^^^^ constant.file-size.nushell
let a = 3.14gib
#       ^^^^^^^ constant.file-size.nushell
let a = 3.14tib
#       ^^^^^^^ constant.file-size.nushell
let a = 3.14pib
#       ^^^^^^^ constant.file-size.nushell
let a = 3.14eib
#       ^^^^^^^ constant.file-size.nushell
let a = 3.14zib
#       ^^^^^^^ constant.file-size.nushell

##
# Range
##

let a = 0..4
#       ^^^^ constant.range.nushell
let a = -4..-1
#       ^^^^^^ constant.range.nushell
let a = 0..<5
#       ^^^^^ constant.range.nushell
let a = 0..
#       ^^^ constant.range.nushell
let a = ..4
#       ^^^ constant.range.nushell

##
# Binary
##

let a = 0x[0 FF]
#       ^^^ meta.binary.hex.nushell punctuation.definition.binary.begin.nushell
#          ^ meta.binary.hex.nushell constant.numeric.hex.nushell
#            ^^ meta.binary.hex.nushell constant.numeric.hex.nushell
let a = 0x[
  # Foo
# ^^^^^ comment.line
  0 FF]
# ^ meta.binary.hex.nushell constant.numeric.hex.nushell
#   ^^ meta.binary.hex.nushell constant.numeric.hex.nushell
#     ^ meta.binary.hex.nushell punctuation.definition.binary.end.nushell

let a = 0b[0 1111111]
#       ^^^ meta.binary.bin.nushell punctuation.definition.binary.begin.nushell
#          ^ meta.binary.bin.nushell constant.numeric.bin.nushell
#            ^^^^^^^ meta.binary.bin.nushell constant.numeric.bin.nushell
let a = 0b[
  # Foo
# ^^^^^ comment.line
  0 1111111]
# ^ meta.binary.bin.nushell constant.numeric.bin.nushell
#   ^^^^^^^ meta.binary.bin.nushell constant.numeric.bin.nushell
#          ^ meta.binary.bin.nushell punctuation.definition.binary.end.nushell

let a = 0o[0 777]
#       ^^^ meta.binary.oct.nushell punctuation.definition.binary.begin.nushell
#          ^ meta.binary.oct.nushell constant.numeric.oct.nushell
#            ^^^ meta.binary.oct.nushell constant.numeric.oct.nushell
let a = 0o[
  # Foo
# ^^^^^ comment.line
  0 777]
# ^ meta.binary.oct.nushell constant.numeric.oct.nushell
#   ^^^ meta.binary.oct.nushell constant.numeric.oct.nushell

##
# Record
##

let a = {
#       ^ meta.record.nushell punctuation.section.record.begin.nushell
  # Foo
# ^^^^^ comment.line
  k1: { k2: v1 } # Foo
# ^^ meta.record.nushell entity.name.label.nushell
#   ^ meta.record.nushell punctuation.separator.key-value.nushell
#     ^ meta.record.nushell punctuation.section.record.begin.nushell
#       ^^ meta.record.nushell meta.record.nushell entity.name.label.nushell
#         ^ meta.record.nushell meta.record.nushell punctuation.separator.key-value.nushell
#           ^^ meta.record.nushell meta.record.nushell string.bare.nushell
#                ^^^^^ meta.record.nushell comment.line
#
}
# <- meta.record.nushell punctuation.section.record.end.nushell

let a = {k1: 1, k2: 2}
#             ^ meta.record.nushell punctuation.separator.comma.nushell

##
# List
##

let a = [a bb ccc]
#       ^ meta.list-table.nushell punctuation.section.list-table.begin.nushell
#        ^ meta.list-table.nushell string.bare.nushell
#          ^^ meta.list-table.nushell string.bare.nushell
#             ^^^ meta.list-table.nushell string.bare.nushell
#                ^meta.list-table.nushell punctuation.section.list-table.end.nushell

let a = [a bb
  ccc # Foo
# ^^^ meta.list-table.nushell string.bare.nushell
#     ^^^^^ comment.line
]
# <- meta.list-table.nushell punctuation.section.list-table.end.nushell

##
# Table
##

let a = [[column1, column2]; [Value1, Value2] [Value3, Value4]]
#        ^ meta.list-table.nushell meta.list-table.nushell punctuation.section.list-table.begin.nushell
#                          ^ meta.list-table.nushell punctuation.terminator.header.nushell

##
# Null
##

let a = null
#       ^^^^ constant.language.null.nushell

##
# String
##

let a = 'foo'
#       ^ meta.string.nushell string.quoted.single.nushell punctuation.definition.string.begin.nushell
#        ^^^ meta.string.nushell string.quoted.single.nushell
#           ^ meta.string.nushell string.quoted.single.nushell punctuation.definition.string.end.nushell

let a = 'foo
  bar'
# ^^^ meta.string.nushell string.quoted.single.nushell
#    ^ meta.string.nushell string.quoted.single.nushell punctuation.definition.string.end.nushell

let a = `foo`
#       ^ meta.string.nushell string.quoted.backtick.nushell punctuation.definition.string.begin.nushell
#        ^^^ meta.string.nushell string.quoted.backtick.nushell
#           ^ meta.string.nushell string.quoted.backtick.nushell punctuation.definition.string.end.nushell

let a = `foo
  bar`
# ^^^ meta.string.nushell string.quoted.backtick.nushell
#    ^ meta.string.nushell string.quoted.backtick.nushell punctuation.definition.string.end.nushell

let a = "foo"
#       ^ meta.string.nushell string.quoted.double.nushell punctuation.definition.string.begin.nushell
#        ^^^ meta.string.nushell string.quoted.double.nushell
#           ^ meta.string.nushell string.quoted.double.nushell punctuation.definition.string.end.nushell

let a = "foo
  bar"
# ^^^ meta.string.nushell string.quoted.double.nushell
#    ^ meta.string.nushell string.quoted.double.nushell punctuation.definition.string.end.nushell

let a = "\a\b\e\f\n\r\t\v\\\'\"\?"
#        ^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.nushell string.quoted.double.nushell constant.character.escape.nushell

let a = "\777"
#        ^^^^ meta.string.nushell string.quoted.double.nushell constant.character.escape.nushell

let a = "\xFF"
#        ^^^^ meta.string.nushell string.quoted.double.nushell constant.character.escape.nushell

let a = "\uFFFF"
#        ^^^^^^ meta.string.nushell string.quoted.double.nushell constant.character.escape.nushell

let a = "\UFFFFFFFF"
#        ^^^^^^^^^^ meta.string.nushell string.quoted.double.nushell constant.character.escape.nushell

let a = foo
#       ^^^ string.bare.nushell

##
# Interpolated string
##

let a = $"($it.name) is ($it.size)"
#       ^^ meta.string.interpolated.nushell string.interpolated.double.nushell punctuation.definition.string.interpolated.begin.nushell
#         ^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.nushell string.interpolated.double.nushell
#          ^^^ variable.language.nushell
#                        ^^^ variable.language.nushell

##
# Variable keyword
##

let a = $b
#       ^^ variable.language.nushell

##
# Block
##

each { |aaa, bbb| aaa }
# <- support.function.nushell
#    ^ meta.block.nushell punctuation.section.block.begin.nushell
#      ^ meta.block.nushell meta.block.parameters.nushell
#       ^^^ meta.block.parameters.nushell variable.parameter.nushell
#          ^ meta.block.parameters.nushell punctuation.separator.parameter.command.nushell
#            ^^^ meta.block.parameters.nushell variable.parameter.nushell
#               ^ meta.block.parameters.nushell

##
# Module
##

module foo_module {
# <- meta.module.nushell keyword.module.nushell
#      ^^^^^^^^^^ meta.module.nushell entity.name.module.nushell
#                 ^ meta.block.nushell punctuation.section.block.begin.nushell
}
# <- meta.block.nushell punctuation.section.block.end.nushell

##
# Command
##

def "aaa\x12bbb" [aaa, bbb: string] {
# <- meta.command.nushell keyword.declaration.nushell
#   ^ meta.command.nushell entity.name.command.nushell entity.name.command.begin.nushell
#    ^^^^^^^^^^ meta.command.nushell entity.name.command.nushell
#       ^^^^ constant.character.escape.nushell
#                ^ meta.command.nushell meta.command.parameters.nushell punctuation.section.group.begin.nushell
#                 ^^^ meta.command.nushell meta.command.parameters.nushell variable.parameter.nushell
#                    ^ meta.command.nushell meta.command.parameters.nushell punctuation.separator.parameter.command.nushell
#                         ^ meta.command.nushell meta.command.parameters.nushell punctuation.separator.type.nushell
#                           ^^^^^^ meta.command.nushell meta.command.parameters.nushell
#                                 ^ meta.command.nushell punctuation.section.group.end.nushell
#                                   ^ meta.command.nushell meta.block.nushell punctuation.section.block.begin.nushell
}
# <- meta.command.nushell meta.block.nushell punctuation.section.block.end.nushell

##
# Extern
##

extern "aaa\x12bbb" [
# <- meta.extern.nushell keyword.extern.nushell
#      ^ meta.extern.nushell entity.name.extern.nushell entity.name.extern.begin.nushell
#          ^^^^ entity.name.extern.nushell constant.character.escape.nushell
#                 ^ entity.name.extern.nushell meta.extern.parameters.nushell entity.name.extern.end.nushell
#                   ^ meta.extern.parameters.nushell punctuation.section.group.begin.nushell
  foo: string@"nu-complete git branches" # Foo
# ^ meta.extern.parameters.nushell variable.parameter.nushell
#    ^ meta.extern.parameters.nushell punctuation.separator.type.nushell
#      ^^^^^^ meta.extern.parameters.nushell storage.type.nushell
#            ^ meta.extern.parameters.nushell keyword.operator.completion.nushell
#             ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.extern.parameters.nushell variable.function.completion.nushell
#                                        ^^^^^ meta.extern.parameters.nushell comment.line
  foo?: string@"nu-complete git branches" # Foo
#    ^ meta.extern.parameters.nushell keyword.operator.optional.nushell
  --foo # Foo
# ^^^^^ meta.extern.parameters.nushell variable.parameter.long.nushell
#       ^^^^^ meta.extern.parameters.nushell comment.line
  --foo(-f) # Foo
# ^^^^^ meta.extern.parameters.nushell variable.parameter.long.nushell
#       ^^ meta.extern.parameters.nushell variable.parameter.short.nushell
#           ^ comment.line
  -a: string # Foo
# ^ meta.extern.parameters.nushell variable.parameter.short.nushell
#            ^^^^^ meta.extern.parameters.nushell comment.line
  -a # Foo
# ^ meta.extern.parameters.nushell variable.parameter.short.nushell
#    ^^^^^ meta.extern.parameters.nushell comment.line
]

##
# Function Call
##

func foo 1
# <- meta.function-call.identifier.nushell variable.function.nushell
#    ^^^ meta.function-call.arguments.nushell string.bare.nushell
#        ^ meta.function-call.arguments.nushell constant.numeric.integer.nushell

roll down
# ^^^^^^^ meta.function-call.identifier.nushell support.function.nushell

(
# <- punctuation.section.group.begin.nushell
  func
# ^^^^ meta.function-call.identifier.nushell variable.function.nushell
  foo
# ^^^ meta.function-call.arguments.nushell string.bare.nushell
  1
# ^ meta.function-call.arguments.nushell constant.numeric.integer.nushell
)
# <- punctuation.section.group.end.nushell

where size > 10kb
# ^^^ meta.function-call.identifier.nushell support.function.nushell
#     ^^^^ meta.function-call.arguments.nushell variable.name.nushell
#          ^ meta.function-call.arguments.nushell keyword.operator.nushell
#            ^^^^ meta.function-call.arguments.nushell constant.file-size.nushell
