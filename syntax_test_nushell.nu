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

##
# Variable
##

$var
# <- variable.other.nu

let a = 1; mut b = 2; # Foo
# <- keyword.other.nu
#   ^ variable.name.nu
#     ^ keyword.operator.assignment.nu
#       ^ constant.numeric.integer.nu
#        ^ punctuation.semi.nu
#          ^^^ keyword.other.nu
#              ^ variable.name.nu
#                ^ keyword.operator.assignment.nu
#                  ^ constant.numeric.integer.nu
#                   ^ punctuation.semi.nu
#                     ^^^^^ comment.line

{ let a = 1 }
# <- meta.block.nu punctuation.section.block.begin.nu
# ^^^ meta.block.nu keyword.other.nu
#     ^ meta.block.nu variable.name.nu
#       ^ meta.block.nu keyword.operator.assignment.nu
#         ^ meta.block.nu constant.numeric.integer.nu
#           ^ meta.block.nu punctuation.section.block.end.nu

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
#       ^^^^^^^ constant.numeric.decimal.nu
let a = -9.9999
#       ^^^^^^^ constant.numeric.decimal.nu
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
  "k\"": 1 # Foo
# ^ meta.record.nu meta.string.nu string.quoted.double.nu punctuation.definition.string.begin.nu
#   ^^ constant.character.escape.nu
#     ^ meta.record.nu meta.string.nu string.quoted.double.nu punctuation.definition.string.end.nu
#      ^ meta.record.nu punctuation.separator.key-value.nu
#        ^ meta.record.nu constant.numeric.integer.nu
#          ^ comment.line
}
# <- meta.record.nu punctuation.section.record.end.nu

let a = {
#       ^ meta.record.nu punctuation.section.record.begin.nu
  'k': 1 # Foo
# ^ meta.record.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.begin.nu
#   ^ meta.record.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.end.nu
#    ^ meta.record.nu punctuation.separator.key-value.nu
#      ^ meta.record.nu constant.numeric.integer.nu
#        ^ comment.line
}
# <- meta.record.nu punctuation.section.record.end.nu

let a = {
#       ^ meta.record.nu punctuation.section.record.begin.nu
  `k`: 1 # Foo
# ^ meta.record.nu meta.string.nu string.quoted.backtick.nu punctuation.definition.string.begin.nu
#   ^ meta.record.nu meta.string.nu string.quoted.backtick.nu punctuation.definition.string.end.nu
#    ^ meta.record.nu punctuation.separator.key-value.nu
#      ^ meta.record.nu constant.numeric.integer.nu
#        ^ comment.line
}
# <- meta.record.nu punctuation.section.record.end.nu

let a = {
#       ^ meta.record.nu punctuation.section.record.begin.nu
  k1: v1
# ^^ meta.record.nu entity.name.label.nu
#   ^ meta.record.nu punctuation.separator.key-value.nu
#     ^^ meta.record.nu string.bare.nu
  k2: v2
# ^^ meta.record.nu entity.name.label.nu
#   ^ meta.record.nu punctuation.separator.key-value.nu
#     ^^ meta.record.nu string.bare.nu
}
# <- meta.record.nu punctuation.section.record.end.nu

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
#       ^ meta.record.nu punctuation.section.record.begin.nu
#        ^^ meta.record.nu entity.name.label.nu
#          ^ meta.record.nu punctuation.separator.key-value.nu
#            ^ meta.record.nu constant.numeric.integer.nu
#             ^ meta.record.nu punctuation.separator.comma.nu
#               ^^ meta.record.nu entity.name.label.nu
#                 ^ meta.record.nu punctuation.separator.key-value.nu
#                   ^ meta.record.nu constant.numeric.integer.nu
#                    ^ meta.record.nu punctuation.section.record.end.nu

let a = {k1: 1 k2: 2}
#       ^ meta.record.nu punctuation.section.record.begin.nu
#        ^^ meta.record.nu entity.name.label.nu
#          ^ meta.record.nu punctuation.separator.key-value.nu
#            ^ meta.record.nu constant.numeric.integer.nu
#              ^^ meta.record.nu entity.name.label.nu
#                ^ meta.record.nu punctuation.separator.key-value.nu
#                  ^ meta.record.nu constant.numeric.integer.nu
#                   ^ meta.record.nu punctuation.section.record.end.nu

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

let a = [(col a | min)]
#       ^ meta.list-table.nu punctuation.section.list-table.begin.nu
#        ^ meta.list-table.nu meta.group.nu punctuation.section.group.begin.nu
#         ^^^ meta.list-table.nu meta.group.nu meta.function-call.identifier.nu support.function.nu
#             ^ meta.list-table.nu meta.group.nu meta.function-call.arguments.nu string.bare.nu
#               ^ meta.list-table.nu meta.group.nu keyword.operator.pipe.nu
#                 ^^^ meta.list-table.nu meta.group.nu meta.function-call.identifier.nu support.function.nu
#                    ^ meta.list-table.nu meta.group.nu punctuation.section.group.end.nu
#                     ^ meta.list-table.nu punctuation.section.list-table.end.nu

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

let a = "\"\'\\\/\b\f\r\n\t"
#        ^^^^^^^^^^^^^^^^^^ meta.string.nu string.quoted.double.nu constant.character.escape.nu

let a = "\u{0}\u{0000FF}"
#        ^^^^^^^^^^^^^^^ meta.string.nu string.quoted.double.nu constant.character.escape.nu

let a = foo
#       ^^^ string.bare.nu

##
# Interpolated string
##

let a = $"($it.name) is ($it.size)"
#       ^^ meta.string.interpolated.nu string.interpolated.double.nu punctuation.definition.string.interpolated.begin.nu
#         ^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.interpolated.nu string.interpolated.double.nu
#          ^^^ variable.other.nu
#                        ^^^ variable.other.nu

##
# Bare string
##
let a = *,./:<>[]{}
#       ^^^^^^^^^^^ string.bare.nu

##
# Variable keyword
##

let a = $b
#       ^^ variable.other.nu

##
# Block
##

each { |aaa, bbb| print $aaa }
# <- support.function.nu
#    ^ meta.block.nu punctuation.section.block.begin.nu
#      ^ meta.block.nu meta.block.parameters.nu
#       ^^^ meta.block.parameters.nu variable.parameter.nu
#          ^ meta.block.parameters.nu punctuation.separator.parameter.command.nu
#            ^^^ meta.block.parameters.nu variable.parameter.nu
#               ^ meta.block.parameters.nu

loop { break }
# <- meta.function-call.identifier.nu keyword.other.nu
#    ^ meta.block.nu punctuation.section.block.begin.nu
#      ^^^^^ meta.block.nu meta.function-call.identifier.nu keyword.other.nu
#            ^ meta.block.nu

##
# For loop
##
for i in 1..10 { print $i }
# <- variable.nu keyword.other.nu
#   ^ variable.nu variable.name.nu
#        ^^^^^ constant.range.nu
#              ^ meta.block.nu punctuation.section.block.begin.nu
#                ^^^^^ meta.block.nu meta.function-call.identifier.nu support.function.nu
#                      ^^ meta.block.nu meta.function-call.arguments.nu variable.other.nu
#                         ^ meta.block.nu punctuation.section.block.end.nu

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

def "aaa\"bbb" [aaa, bbb: string] {
# <- meta.command.nu keyword.declaration.nu
#   ^ meta.command.nu entity.name.command.nu entity.name.command.begin.nu
#    ^^^^^^^^^ meta.command.nu entity.name.command.nu
#       ^^ constant.character.escape.nu
#              ^ meta.command.nu meta.command.parameters.nu punctuation.section.group.begin.nu
#               ^^^ meta.command.nu meta.command.parameters.nu variable.parameter.nu
#                  ^ meta.command.nu meta.command.parameters.nu punctuation.separator.parameter.command.nu
#                       ^ meta.command.nu meta.command.parameters.nu punctuation.separator.type.nu
#                         ^^^^^^ meta.command.nu meta.command.parameters.nu
#                               ^ meta.command.nu punctuation.section.group.end.nu
#                                 ^ meta.command.nu meta.block.nu punctuation.section.block.begin.nu
}
# <- meta.command.nu meta.block.nu punctuation.section.block.end.nu

##
# Extern
##

extern "aaa\"bbb" [
# <- meta.extern.nu keyword.extern.nu
#      ^ meta.extern.nu entity.name.extern.nu entity.name.extern.begin.nu
#          ^^ entity.name.extern.nu constant.character.escape.nu
#               ^ entity.name.extern.nu meta.extern.parameters.nu entity.name.extern.end.nu
#                 ^ meta.extern.parameters.nu punctuation.section.group.begin.nu
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

foo; bar
# <- meta.function-call.identifier.nu variable.function.nu
#  ^ punctuation.semi.nu
#    ^^^ meta.function-call.identifier.nu variable.function.nu

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

##
# Special statements
##

if is-admin { echo a } else { echo b }
# <- keyword.control.conditional.if.nu
#  ^^^^^^^^ meta.function-call.identifier.nu keyword.other.nu
#           ^ meta.block.nu punctuation.section.block.begin.nu
#             ^^^^ meta.block.nu meta.function-call.identifier.nu keyword.other.nu
#                  ^ meta.block.nu meta.function-call.arguments.nu string.bare.nu
#                    ^ meta.block.nu punctuation.section.block.end.nu
#                      ^^^^ keyword.control.conditional.else.nu
#                           ^ meta.block.nu punctuation.section.block.begin.nu
#                             ^^^^ meta.block.nu meta.function-call.identifier.nu keyword.other.nu
#                                  ^ meta.block.nu meta.function-call.arguments.nu string.bare.nu
#                                    ^ meta.block.nu punctuation.section.block.end.nu

let a = if false { -1 } else { 1 }
# <- keyword.other.nu
#   ^ variable.name.nu
#     ^ keyword.operator.assignment.nu
#       ^^ keyword.control.conditional.if.nu
#          ^^^^^ constant.language.boolean.false.nu
#                ^ meta.block.nu punctuation.section.block.begin.nu
#                  ^^ meta.block.nu constant.numeric.integer.nu
#                     ^ meta.block.nu punctuation.section.block.end.nu
#                       ^^^^ keyword.control.conditional.else.nu
#                            ^ meta.block.nu punctuation.section.block.begin.nu
#                              ^ meta.block.nu constant.numeric.integer.nu
#                                ^ meta.block.nu punctuation.section.block.end.nu

where foo | null
# <- meta.function-call.identifier.nu support.function.nu
#     ^^^ meta.function-call.arguments.row-condition.nu variable.name.nu
#         ^ keyword.operator.pipe.nu
#           ^^^^ meta.function-call.identifier.nu variable.function.nu

where foo == bar && foo == bar | null
# <- meta.function-call.identifier.nu support.function.nu
#     ^^^ meta.function-call.arguments.row-condition.nu variable.name.nu
#         ^^ meta.function-call.arguments.row-condition.nu keyword.operator.nu
#            ^^^ meta.function-call.arguments.row-condition.nu string.bare.nu
#                ^^ meta.function-call.arguments.row-condition.nu keyword.operator.nu
#                   ^^^ meta.function-call.arguments.row-condition.nu variable.name.nu
#                       ^^ meta.function-call.arguments.row-condition.nu keyword.operator.nu
#                          ^^^ meta.function-call.arguments.row-condition.nu string.bare.nu
#                              ^ keyword.operator.pipe.nu
#                                ^^^^ meta.function-call.identifier.nu variable.function.nu

where size > 10kb && size < 100kb | null
# <- meta.function-call.identifier.nu support.function.nu
#     ^^^^ meta.function-call.arguments.row-condition.nu variable.name.nu
#          ^ meta.function-call.arguments.row-condition.nu keyword.operator.nu
#            ^^^^ meta.function-call.arguments.row-condition.nu constant.file-size.nu
#                 ^^ meta.function-call.arguments.row-condition.nu keyword.operator.nu
#                    ^^^^ meta.function-call.arguments.row-condition.nu variable.name.nu
#                         ^ meta.function-call.arguments.row-condition.nu keyword.operator.nu
#                           ^^^^^ meta.function-call.arguments.row-condition.nu constant.file-size.nu
#                                 ^ keyword.operator.pipe.nu
#                                   ^^^^ meta.function-call.identifier.nu variable.function.nu

##
# Pipelines
##

# Spaces aren't needed
col a|min|as b
# <- meta.function-call.identifier.nu support.function.nu
#   ^ meta.function-call.arguments.nu string.bare.nu
#    ^ keyword.operator.pipe.nu
#     ^^^ meta.function-call.identifier.nu support.function.nu
#        ^ keyword.operator.pipe.nu
#         ^^ meta.function-call.identifier.nu support.function.nu
#            ^ meta.function-call.arguments.nu string.bare.nu

##
# Subexpressions
##

(col a | min | as b)
# <- punctuation.section.group.begin.nu
# ^^ meta.function-call.identifier.nu support.function.nu
#    ^ string.bare.nu
#      ^ keyword.operator.pipe.nu
#        ^^^ meta.function-call.identifier.nu support.function.nu
#            ^ keyword.operator.pipe.nu
#              ^^ meta.function-call.identifier.nu support.function.nu
#                 ^ meta.group.nu meta.function-call.arguments.nu string.bare.nu
#                  ^ meta.group.nu punctuation.section.group.end.nu

((col a))
# <- meta.group.nu punctuation.section.group.begin.nu
#^ meta.group.nu meta.group.nu punctuation.section.group.begin.nu
# ^^^ meta.group.nu meta.group.nu meta.function-call.identifier.nu support.function.nu
#     ^ meta.group.nu meta.group.nu meta.function-call.arguments.nu string.bare.nu
#      ^ meta.group.nu meta.group.nu punctuation.section.group.end.nu
#       ^ meta.group.nu punctuation.section.group.end.nu

##
# Properties
##

$var.foo.bar
# <- variable.other.nu
#   ^ punctuation.accessor.nu
#    ^^^ meta.property.record.nu
#       ^ punctuation.accessor.nu
#        ^^^ meta.property.record.nu

(term size).foo.bar
# <- meta.group.nu punctuation.section.group.begin.nu
# ^^^^^^^^ meta.group.nu meta.function-call.identifier.nu support.function.nu
#         ^ meta.group.nu punctuation.section.group.end.nu
#          ^ punctuation.accessor.nu
#           ^^^ meta.property.record.nu
#              ^ punctuation.accessor.nu
#               ^^^ meta.property.record.nu
