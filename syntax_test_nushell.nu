# SYNTAX TEST "Packages/Nushell/nushell.sublime-syntax"
# <- source.shell.nu comment.line.number-sign

##
# Comment
##

# Foo
# <- comment.line.number-sign.nu
# ^^^ comment.line.nu

foo # Foo
#   ^ comment.line

$var
# <- variable.language.nu

##
# Integer
##

let a = 1
#       ^ constant.numeric.integer.nu
let a = -65535
#       ^^^^^^ constant.numeric.integer.nu

let a = 1a
#       ^^ string.bare.nu

##
# Operator
##
let a = 3 * (1 + 2)
#         ^ keyword.operator.nu
#           ^ meta.group.nu punctuation.section.group.begin.nu
#              ^ keyword.operator.nu
#                ^ meta.group.nu constant.numeric.integer.nu
#                 ^ meta.group.nu punctuation.section.group.end.nu

##
# Decimal
##

let a = 9.9999
#       ^^^^^^ constant.numeric.decimal.nu
let a = +9.9999
#       ^^^^^^ constant.numeric.decimal.nu
let a = -9.9999
#       ^^^^^^ constant.numeric.decimal.nu
let a = -9.9999a
#       ^^^^^^^^ string.bare.nu
let a = Infinity
#       ^^^^^^^^ constant.numeric.decimal.nu
let a = +Infinity
#       ^^^^^^^^^ constant.numeric.decimal.nu
let a = -Infinity
#       ^^^^^^^^^ constant.numeric.decimal.nu
let a = Infinitya
#       ^^^^^^^^^ string.bare.nu
let a = NaN
#       ^^^ constant.numeric.decimal.nu
let a = +NaN
#       ^^^^ constant.numeric.decimal.nu
let a = -NaN
#       ^^^^ constant.numeric.decimal.nu
let a = NaNa
#       ^^^^ string.bare.nu

##
# Boolean
##

let a = true
#       ^^^^ constant.language.boolean.true.nu
let a = false
#       ^^^^ constant.language.boolean.false.nu

##
# Date
##

let a = 2022-02-02
#       ^^^^^^^^^^ constant.date.nu
let a = 2022-02-02T14:30:00
#       ^^^^^^^^^^^^^^^^^^^ constant.date.nu
let a = 2022-02-02T14:30:00+05:00
#       ^^^^^^^^^^^^^^^^^^^^^^^^^ constant.date.nu

##
# Duration
##

let a = 3.14ns
#       ^^^^^^ constant.duration.nu
let a = 3.14us
#       ^^^^^^ constant.duration.nu
let a = 3.14ms
#       ^^^^^^ constant.duration.nu
let a = 3.14sec
#       ^^^^^^^ constant.duration.nu
let a = 3.14min
#       ^^^^^^^ constant.duration.nu
let a = 3.14hr
#       ^^^^^^ constant.duration.nu
let a = 3.14day
#       ^^^^^^^ constant.duration.nu
let a = 3.14wk
#       ^^^^^^ constant.duration.nu

##
# File Size
##

let a = 3.14b
#       ^^^^^ constant.file-size.nu
let a = 3.14kb
#       ^^^^^^ constant.file-size.nu
let a = 3.14mb
#       ^^^^^^ constant.file-size.nu
let a = 3.14gb
#       ^^^^^^ constant.file-size.nu
let a = 3.14tb
#       ^^^^^^ constant.file-size.nu
let a = 3.14pb
#       ^^^^^^ constant.file-size.nu
let a = 3.14eb
#       ^^^^^^ constant.file-size.nu
let a = 3.14zb
#       ^^^^^^ constant.file-size.nu
let a = 3.14kib
#       ^^^^^^^ constant.file-size.nu
let a = 3.14mib
#       ^^^^^^^ constant.file-size.nu
let a = 3.14gib
#       ^^^^^^^ constant.file-size.nu
let a = 3.14tib
#       ^^^^^^^ constant.file-size.nu
let a = 3.14pib
#       ^^^^^^^ constant.file-size.nu
let a = 3.14eib
#       ^^^^^^^ constant.file-size.nu
let a = 3.14zib
#       ^^^^^^^ constant.file-size.nu

##
# Range
##

let a = 0..4
#       ^^^^ constant.range.nu
let a = -4..-1
#       ^^^^^^ constant.range.nu
let a = 0..<5
#       ^^^^^ constant.range.nu
let a = 0..
#       ^^^ constant.range.nu
let a = ..4
#       ^^^ constant.range.nu

##
# Binary
##

let a = 0x[0 FF]
#       ^^^ meta.binary.hex.nu punctuation.definition.binary.begin.nu
#          ^ meta.binary.hex.nu constant.numeric.hex.nu
#            ^^ meta.binary.hex.nu constant.numeric.hex.nu
let a = 0x[
  # Foo
# ^^^^^ comment.line
  0 FF]
# ^ meta.binary.hex.nu constant.numeric.hex.nu
#   ^^ meta.binary.hex.nu constant.numeric.hex.nu
#     ^ meta.binary.hex.nu punctuation.definition.binary.end.nu

let a = 0b[0 1111111]
#       ^^^ meta.binary.bin.nu punctuation.definition.binary.begin.nu
#          ^ meta.binary.bin.nu constant.numeric.bin.nu
#            ^^^^^^^ meta.binary.bin.nu constant.numeric.bin.nu
let a = 0b[
  # Foo
# ^^^^^ comment.line
  0 1111111]
# ^ meta.binary.bin.nu constant.numeric.bin.nu
#   ^^^^^^^ meta.binary.bin.nu constant.numeric.bin.nu
#          ^ meta.binary.bin.nu punctuation.definition.binary.end.nu

let a = 0o[0 777]
#       ^^^ meta.binary.oct.nu punctuation.definition.binary.begin.nu
#          ^ meta.binary.oct.nu constant.numeric.oct.nu
#            ^^^ meta.binary.oct.nu constant.numeric.oct.nu
let a = 0o[
  # Foo
# ^^^^^ comment.line
  0 777]
# ^ meta.binary.oct.nu constant.numeric.oct.nu
#   ^^^ meta.binary.oct.nu constant.numeric.oct.nu

##
# Record
##

let a = {
#       ^ meta.record.nu punctuation.section.record.begin.nu
  # Foo
# ^^^^^ comment.line
  k1: { k2: v1 } # Foo
# ^^ meta.record.nu entity.name.label.nu
#   ^ meta.record.nu punctuation.separator.key-value.nu
#     ^ meta.record.nu punctuation.section.record.begin.nu
#       ^^ meta.record.nu meta.record.nu entity.name.label.nu
#         ^ meta.record.nu meta.record.nu punctuation.separator.key-value.nu
#           ^^ meta.record.nu meta.record.nu string.bare.nu
#                ^^^^^ meta.record.nu comment.line
#
}
# <- meta.record.nu punctuation.section.record.end.nu

let a = {k1: 1, k2: 2}
#             ^ meta.record.nu punctuation.separator.comma.nu

##
# List
##

let a = [a bb ccc]
#       ^ meta.list-table.nu punctuation.section.list-table.begin.nu
#        ^ meta.list-table.nu string.bare.nu
#          ^^ meta.list-table.nu string.bare.nu
#             ^^^ meta.list-table.nu string.bare.nu
#                ^meta.list-table.nu punctuation.section.list-table.end.nu

let a = [a bb
  ccc # Foo
# ^^^ meta.list-table.nu string.bare.nu
#     ^^^^^ comment.line
]
# <- meta.list-table.nu punctuation.section.list-table.end.nu

let a = [0,a,b]
#       ^ meta.list-table.nu punctuation.section.list-table.begin.nu
#         ^ meta.list-table.nu punctuation.separator.comma.nu
#          ^ meta.list-table.nu string.bare.nu
#            ^ meta.list-table.nu string.bare.nu
#             ^ meta.list-table.nu punctuation.section.list-table.end.nu

##
# Table
##

let a = [[column1, column2]; [Value1, Value2] [Value3, Value4]]
#        ^ meta.list-table.nu meta.list-table.nu punctuation.section.list-table.begin.nu
#                          ^ meta.list-table.nu punctuation.terminator.header.nu

##
# Null
##

let a = null
#       ^^^^ constant.language.null.nu

##
# String
##

let a = 'foo'
#       ^ meta.string.nu string.quoted.single.nu punctuation.definition.string.begin.nu
#        ^^^ meta.string.nu string.quoted.single.nu
#           ^ meta.string.nu string.quoted.single.nu punctuation.definition.string.end.nu

let a = 'foo
  bar'
# ^^^ meta.string.nu string.quoted.single.nu
#    ^ meta.string.nu string.quoted.single.nu punctuation.definition.string.end.nu

let a = `foo`
#       ^ meta.string.nu string.quoted.backtick.nu punctuation.definition.string.begin.nu
#        ^^^ meta.string.nu string.quoted.backtick.nu
#           ^ meta.string.nu string.quoted.backtick.nu punctuation.definition.string.end.nu

let a = `foo
  bar`
# ^^^ meta.string.nu string.quoted.backtick.nu
#    ^ meta.string.nu string.quoted.backtick.nu punctuation.definition.string.end.nu

let a = "foo"
#       ^ meta.string.nu string.quoted.double.nu punctuation.definition.string.begin.nu
#        ^^^ meta.string.nu string.quoted.double.nu
#           ^ meta.string.nu string.quoted.double.nu punctuation.definition.string.end.nu

let a = "foo
  bar"
# ^^^ meta.string.nu string.quoted.double.nu
#    ^ meta.string.nu string.quoted.double.nu punctuation.definition.string.end.nu

let a = "\a\b\e\f\n\r\t\v\\\'\"\?"
#        ^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.nu string.quoted.double.nu constant.character.escape.nu

let a = "\777"
#        ^^^^ meta.string.nu string.quoted.double.nu constant.character.escape.nu

let a = "\xFF"
#        ^^^^ meta.string.nu string.quoted.double.nu constant.character.escape.nu

let a = "\uFFFF"
#        ^^^^^^ meta.string.nu string.quoted.double.nu constant.character.escape.nu

let a = "\UFFFFFFFF"
#        ^^^^^^^^^^ meta.string.nu string.quoted.double.nu constant.character.escape.nu

let a = foo
#       ^^^ string.bare.nu

##
# Interpolated string
##

let a = $"($it.name) is ($it.size)"
#       ^^ meta.string.interpolated.nu string.interpolated.double.nu punctuation.definition.string.interpolated.begin.nu
#         ^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.nu string.interpolated.double.nu
#          ^^^ variable.language.nu
#                        ^^^ variable.language.nu

##
# Variable keyword
##

let a = $b
#       ^^ variable.language.nu

##
# Block
##

each { |aaa, bbb| aaa }
# <- support.function.nu
#    ^ meta.block.nu punctuation.section.block.begin.nu
#      ^ meta.block.nu meta.block.parameters.nu
#       ^^^ meta.block.parameters.nu variable.parameter.nu
#          ^ meta.block.parameters.nu punctuation.separator.parameter.command.nu
#            ^^^ meta.block.parameters.nu variable.parameter.nu
#               ^ meta.block.parameters.nu

loop { break }
# <- meta.function-call.identifier.nu support.function.nu
#    ^ meta.block.nu punctuation.section.block.begin.nu
#      ^^^^^ meta.block.nu meta.function-call.identifier.nu support.function.nu
#            ^ meta.block.nu

##
# Module
##

module foo_module {
# <- meta.module.nu keyword.module.nu
#      ^^^^^^^^^^ meta.module.nu entity.name.module.nu
#                 ^ meta.block.nu punctuation.section.block.begin.nu
}
# <- meta.block.nu punctuation.section.block.end.nu

##
# Command
##

def "aaa\x12bbb" [aaa, bbb: string] {
# <- meta.command.nu keyword.declaration.nu
#   ^ meta.command.nu entity.name.command.nu entity.name.command.begin.nu
#    ^^^^^^^^^^ meta.command.nu entity.name.command.nu
#       ^^^^ constant.character.escape.nu
#                ^ meta.command.nu meta.command.parameters.nu punctuation.section.group.begin.nu
#                 ^^^ meta.command.nu meta.command.parameters.nu variable.parameter.nu
#                    ^ meta.command.nu meta.command.parameters.nu punctuation.separator.parameter.command.nu
#                         ^ meta.command.nu meta.command.parameters.nu punctuation.separator.type.nu
#                           ^^^^^^ meta.command.nu meta.command.parameters.nu
#                                 ^ meta.command.nu punctuation.section.group.end.nu
#                                   ^ meta.command.nu meta.block.nu punctuation.section.block.begin.nu
}
# <- meta.command.nu meta.block.nu punctuation.section.block.end.nu

##
# Extern
##

extern "aaa\x12bbb" [
# <- meta.extern.nu keyword.extern.nu
#      ^ meta.extern.nu entity.name.extern.nu entity.name.extern.begin.nu
#          ^^^^ entity.name.extern.nu constant.character.escape.nu
#                 ^ entity.name.extern.nu meta.extern.parameters.nu entity.name.extern.end.nu
#                   ^ meta.extern.parameters.nu punctuation.section.group.begin.nu
  foo: string@"nu-complete git branches" # Foo
# ^ meta.extern.parameters.nu variable.parameter.nu
#    ^ meta.extern.parameters.nu punctuation.separator.type.nu
#      ^^^^^^ meta.extern.parameters.nu storage.type.nu
#            ^ meta.extern.parameters.nu keyword.operator.completion.nu
#             ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.extern.parameters.nu variable.function.completion.nu
#                                        ^^^^^ meta.extern.parameters.nu comment.line
  foo?: string@"nu-complete git branches" # Foo
#    ^ meta.extern.parameters.nu keyword.operator.optional.nu
  --foo # Foo
# ^^^^^ meta.extern.parameters.nu variable.parameter.long.nu
#       ^^^^^ meta.extern.parameters.nu comment.line
  --foo(-f) # Foo
# ^^^^^ meta.extern.parameters.nu variable.parameter.long.nu
#       ^^ meta.extern.parameters.nu variable.parameter.short.nu
#           ^ comment.line
  -a: string # Foo
# ^ meta.extern.parameters.nu variable.parameter.short.nu
#            ^^^^^ meta.extern.parameters.nu comment.line
  -a # Foo
# ^ meta.extern.parameters.nu variable.parameter.short.nu
#    ^^^^^ meta.extern.parameters.nu comment.line
]

##
# Function Call
##

func foo -a --bar 1
# <- meta.function-call.identifier.nu variable.function.nu
#    ^^^ meta.function-call.arguments.nu string.bare.nu
#        ^^ meta.function-call.arguments.nu string.bare.nu
#           ^^^^^ meta.function-call.arguments.nu string.bare.nu
#                 ^ meta.function-call.arguments.nu constant.numeric.integer.nu

roll down
# ^^^^^^^ meta.function-call.identifier.nu support.function.nu

(
# <- punctuation.section.group.begin.nu
  func
# ^^^^ meta.group.nu meta.function-call.identifier.nu variable.function.nu
  foo
# ^^^ meta.group.nu meta.function-call.arguments.nu string.bare.nu
  1
# ^ meta.group.nu meta.function-call.arguments.nu constant.numeric.integer.nu
)
# <- punctuation.section.group.end.nu

where size > 10kb
# ^^^ meta.function-call.identifier.nu support.function.nu
#     ^^^^ meta.function-call.arguments.nu variable.name.nu
#          ^ meta.function-call.arguments.nu keyword.operator.nu
#            ^^^^ meta.function-call.arguments.nu constant.file-size.nu

##
# Subexpressions
##
(col b | min | as "b_min")
# <- punctuation.section.group.begin.nu
# ^^ meta.function-call.identifier.nu support.function.nu
#    ^ string.bare.nu
#      ^ keyword.operator.nu
#        ^^^ meta.function-call.identifier.nu support.function.nu
#            ^ keyword.operator.nu
#              ^^ meta.function-call.identifier.nu support.function.nu
#                 ^ meta.function-call.arguments.nu meta.string.nu string.quoted.double.nu punctuation.definition.string.begin.nu
#                  ^^^^^ meta.function-call.arguments.nu meta.string.nu string.quoted.double.nu
#                       ^ meta.function-call.arguments.nu meta.string.nu string.quoted.double.nu punctuation.definition.string.end.nu
#                        ^ punctuation.section.group.end.nu
