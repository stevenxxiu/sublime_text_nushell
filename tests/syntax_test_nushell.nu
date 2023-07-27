# SYNTAX TEST "Packages/Nushell/nushell.sublime-syntax"
# <- source.shell.nu comment.line.number-sign.nu

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

$env $in $nothing $nu
# ^^ variable.language.nu
#    ^^^ variable.language.nu
#        ^^^^^^^^ variable.language.nu
#                 ^^^ variable.language.nu

$in_
# ^^ variable.other.nu

$env.aaa.bbb?.ccc
# ^^ variable.language.nu
#   ^ punctuation.accessor.nu
#    ^^^ meta.property.nu
#       ^ punctuation.accessor.nu
#        ^^^ meta.property.nu
#           ^ keyword.operator.optional.nu
#            ^ punctuation.accessor.nu
#             ^^^ meta.property.nu

const a = 1 # Foo
# <- keyword.other.nu
#     ^ variable.name.nu
#       ^ keyword.operator.assignment.nu
#         ^ constant.numeric.integer.nu
#           ^^^^^ comment.line

let a = 1 # Foo
# <- keyword.other.nu
#   ^ variable.name.nu
#     ^ keyword.operator.assignment.nu
#       ^ constant.numeric.integer.nu
#         ^^^^^ comment.line

mut a = 1 # Foo
# <- keyword.other.nu
#   ^ variable.name.nu
#     ^ keyword.operator.assignment.nu
#       ^ constant.numeric.integer.nu
#         ^^^^^ comment.line

$b = $a + 1
# <- variable.name.nu
#  ^ keyword.operator.assignment.nu
#    ^^ variable.other.nu
#       ^ keyword.operator.nu
#         ^ constant.numeric.integer.nu

{ let a = 1 }
# <- meta.closure.nu punctuation.section.closure.begin.nu
# ^^^ meta.closure.nu keyword.other.nu
#     ^ meta.closure.nu variable.name.nu
#       ^ meta.closure.nu keyword.operator.assignment.nu
#         ^ meta.closure.nu constant.numeric.integer.nu
#           ^ meta.closure.nu punctuation.section.closure.end.nu

##
# Integer
##

let a = 1
#       ^ constant.numeric.integer.nu
let a = -65535
#       ^^^^^^ constant.numeric.integer.nu

let a = 1a
#       ^^ meta.function-call.identifier.nu variable.function.nu

##
# Operator
##

let a = -1 - 2 * (3 + 4)
#       ^^ constant.numeric.integer.nu
#          ^ keyword.operator.nu
#              ^ keyword.operator.nu
#                ^ meta.group.nu punctuation.section.group.begin.nu
#                   ^ keyword.operator.nu
#                     ^ meta.group.nu constant.numeric.integer.nu
#                      ^ meta.group.nu punctuation.section.group.end.nu

##
# Decimal
##

let a = 9.9999
#       ^^^^^^ constant.numeric.decimal.nu
let a = +9.9999
#       ^^^^^^^ constant.numeric.decimal.nu
let a = -9.9999
#       ^^^^^^^ constant.numeric.decimal.nu
let a = Infinity
#       ^^^^^^^^ constant.numeric.decimal.nu
let a = +Infinity
#       ^^^^^^^^^ constant.numeric.decimal.nu
let a = -Infinity
#       ^^^^^^^^^ constant.numeric.decimal.nu
let a = Infinitya
#       ^^^^^^^^^ meta.function-call.identifier.nu variable.function.nu
let a = NaN
#       ^^^ constant.numeric.decimal.nu
let a = +NaN
#       ^^^^ constant.numeric.decimal.nu
let a = -NaN
#       ^^^^ constant.numeric.decimal.nu
let a = NaNa
#       ^^^^ meta.function-call.identifier.nu variable.function.nu

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
# ^^^^^ meta.binary.hex.nu comment.line
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
# ^^^^^ meta.binary.bin.nu comment.line
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
# ^^^^^ meta.binary.oct.nu comment.line
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
#          ^ meta.record.nu comment.line
}
# <- meta.record.nu punctuation.section.record.end.nu

let a = {
#       ^ meta.record.nu punctuation.section.record.begin.nu
  'k': 1 # Foo
# ^ meta.record.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.begin.nu
#   ^ meta.record.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.end.nu
#    ^ meta.record.nu punctuation.separator.key-value.nu
#      ^ meta.record.nu constant.numeric.integer.nu
#        ^ meta.record.nu comment.line
}
# <- meta.record.nu punctuation.section.record.end.nu

let a = {
#       ^ meta.record.nu punctuation.section.record.begin.nu
  `k`: 1 # Foo
# ^ meta.record.nu meta.string.nu string.quoted.backtick.nu punctuation.definition.string.begin.nu
#   ^ meta.record.nu meta.string.nu string.quoted.backtick.nu punctuation.definition.string.end.nu
#    ^ meta.record.nu punctuation.separator.key-value.nu
#      ^ meta.record.nu constant.numeric.integer.nu
#        ^ meta.record.nu comment.line
}
# <- meta.record.nu punctuation.section.record.end.nu

let a = {
#       ^ meta.record.nu punctuation.section.record.begin.nu
  k1: a
# ^^ meta.record.nu entity.name.label.nu
#   ^ meta.record.nu punctuation.separator.key-value.nu
#     ^ meta.record.nu string.bare.nu
  k2: b
# ^^ meta.record.nu entity.name.label.nu
#   ^ meta.record.nu punctuation.separator.key-value.nu
#     ^ meta.record.nu string.bare.nu
}
# <- meta.record.nu punctuation.section.record.end.nu

let a = {
#       ^ meta.record.nu punctuation.section.record.begin.nu
  # Foo
# ^^^^^ meta.record.nu comment.line
  k1: { k2: a } # Foo
# ^^ meta.record.nu entity.name.label.nu
#   ^ meta.record.nu punctuation.separator.key-value.nu
#     ^ meta.record.nu punctuation.section.record.begin.nu
#       ^^ meta.record.nu meta.record.nu entity.name.label.nu
#         ^ meta.record.nu meta.record.nu punctuation.separator.key-value.nu
#           ^ meta.record.nu meta.record.nu string.bare.nu
#             ^ meta.record.nu meta.record.nu punctuation.section.record.end.nu
#               ^^^^^ meta.record.nu comment.line
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
#     ^^^^^ meta.list-table.nu comment.line
]
# <- meta.list-table.nu punctuation.section.list-table.end.nu

let a = [0,a,b]
#       ^ meta.list-table.nu punctuation.section.list-table.begin.nu
#         ^ meta.list-table.nu punctuation.separator.comma.nu
#          ^ meta.list-table.nu string.bare.nu
#            ^ meta.list-table.nu string.bare.nu
#             ^ meta.list-table.nu punctuation.section.list-table.end.nu

let a = [(aaa 1 | bbb)]
#       ^ meta.list-table.nu punctuation.section.list-table.begin.nu
#        ^ meta.list-table.nu meta.group.nu punctuation.section.group.begin.nu
#         ^^^ meta.list-table.nu meta.group.nu meta.function-call.identifier.nu variable.function.nu
#             ^ meta.list-table.nu meta.group.nu meta.function-call.arguments.nu constant.numeric.integer.nu
#               ^ meta.list-table.nu meta.group.nu keyword.operator.pipe.nu
#                 ^^^ meta.list-table.nu meta.group.nu meta.function-call.identifier.nu variable.function.nu
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

let a = *./~
#       ^^^^ string.bare.nu

##
# Closure
##

each {
# <- meta.function-call.identifier.nu support.function.nu
  # Foo
# ^^^^^ meta.closure.nu comment.line
  |aaa, bbb: int| print $aaa | ccc
# ^ meta.closure.nu meta.parameters.nu punctuation.section.group.begin.nu
#  ^^^ meta.closure.nu meta.parameters.nu variable.parameter.nu
#     ^ meta.closure.nu meta.parameters.nu punctuation.separator.parameter.nu
#       ^^^ meta.closure.nu meta.parameters.nu variable.parameter.nu
#          ^ meta.closure.nu meta.parameters.nu punctuation.separator.type.nu
#            ^^^ meta.closure.nu meta.parameters.nu storage.type.nu
#               ^ meta.closure.nu meta.parameters.nu punctuation.section.group.end.nu
#                 ^^^^^ meta.closure.nu meta.function-call.identifier.nu support.function.nu
#                       ^^^^ meta.closure.nu meta.function-call.arguments.nu variable.other.nu
#                            ^ meta.closure.nu keyword.operator.pipe.nu
#                              ^^^ meta.closure.nu meta.function-call.identifier.nu variable.function.nu
}
# <- meta.closure.nu punctuation.section.closure.end.nu

each { |aaa, bbb: int| print $aaa | ccc }
# <- meta.function-call.identifier.nu support.function.nu
#    ^ meta.closure.nu punctuation.section.closure.begin.nu
#      ^ meta.closure.nu meta.parameters.nu punctuation.section.group.begin.nu
#       ^^^ meta.closure.nu meta.parameters.nu variable.parameter.nu
#          ^ meta.closure.nu meta.parameters.nu punctuation.separator.parameter.nu
#            ^^^ meta.closure.nu meta.parameters.nu variable.parameter.nu
#               ^ meta.closure.nu meta.parameters.nu punctuation.separator.type.nu
#                 ^^^ meta.closure.nu meta.parameters.nu storage.type.nu
#                    ^ meta.closure.nu meta.parameters.nu punctuation.section.group.end.nu
#                      ^^^^^ meta.closure.nu meta.function-call.identifier.nu support.function.nu
#                            ^^^^ meta.closure.nu meta.function-call.arguments.nu variable.other.nu
#                                 ^ meta.closure.nu keyword.operator.pipe.nu
#                                   ^^^ meta.closure.nu meta.function-call.identifier.nu variable.function.nu
#                                       ^ meta.closure.nu punctuation.section.closure.end.nu

##
# Block
##

{
# <- meta.closure.nu punctuation.section.closure.begin.nu
  aaa |
# ^^^ meta.closure.nu meta.function-call.identifier.nu variable.function.nu
#     ^ meta.closure.nu keyword.operator.pipe.nu
    bbb
#   ^^^ meta.closure.nu meta.function-call.identifier.nu variable.function.nu
}
# <- meta.closure.nu punctuation.section.closure.end.nu

{ break }
# <- meta.closure.nu punctuation.section.closure.begin.nu
# ^^^^^ meta.closure.nu meta.function-call.identifier.nu keyword.other.nu
#       ^ meta.closure.nu punctuation.section.closure.end.nu

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

def "aaa\"bbb" [] {
# <- meta.command.nu keyword.declaration.nu
#   ^ meta.command.nu entity.name.command.nu entity.name.command.begin.nu
#    ^^^^^^^^^ meta.command.nu entity.name.command.nu
#              ^ meta.command.nu meta.parameters.nu punctuation.section.group.begin.nu
#               ^ meta.command.nu meta.parameters.nu punctuation.section.group.end.nu
#                 ^ meta.command.nu meta.block.nu punctuation.section.block.begin.nu
  foo
# ^^^ meta.command.nu meta.block.nu meta.function-call.identifier.nu variable.function.nu
}
# <- meta.command.nu meta.block.nu punctuation.section.block.end.nu

def aaa [bbb, ccc] {}
# <- meta.command.nu keyword.declaration.nu
#   ^^^ meta.command.nu meta.parameters.nu entity.name.command.nu
#       ^ meta.command.nu meta.parameters.nu punctuation.section.group.begin.nu
#        ^^^ meta.command.nu meta.parameters.nu variable.parameter.nu
#           ^ meta.command.nu meta.parameters.nu punctuation.separator.parameter.nu
#             ^^^ meta.command.nu meta.parameters.nu variable.parameter.nu
#                ^ meta.command.nu meta.parameters.nu punctuation.section.group.end.nu
#                  ^ meta.command.nu meta.block.nu punctuation.section.block.begin.nu
#                   ^ meta.command.nu meta.block.nu punctuation.section.block.end.nu

def aaa [
# <- meta.command.nu keyword.declaration.nu
#   ^^^ meta.command.nu meta.parameters.nu entity.name.command.nu
#       ^ meta.command.nu meta.parameters.nu punctuation.section.group.begin.nu
  bbb
# ^^^ meta.command.nu meta.parameters.nu variable.parameter.nu
  ccc
# ^^^ meta.command.nu meta.parameters.nu variable.parameter.nu
] {}
# <- meta.command.nu meta.parameters.nu punctuation.section.group.end.nu
# ^ meta.command.nu meta.block.nu punctuation.section.block.begin.nu
#  ^ meta.command.nu meta.block.nu punctuation.section.block.end.nu

def aaa [bbb: string] {}
# <- meta.command.nu keyword.declaration.nu
#   ^^^ meta.command.nu meta.parameters.nu entity.name.command.nu
#       ^ meta.command.nu meta.parameters.nu punctuation.section.group.begin.nu
#        ^^^ meta.command.nu meta.parameters.nu variable.parameter.nu
#           ^ meta.command.nu meta.parameters.nu punctuation.separator.type.nu
#             ^^^^^^ meta.command.nu meta.parameters.nu storage.type.nu
#                   ^ meta.command.nu meta.parameters.nu punctuation.section.group.end.nu
#                     ^ meta.command.nu meta.block.nu punctuation.section.block.begin.nu
#                      ^ meta.command.nu meta.block.nu punctuation.section.block.end.nu

def aaa [bbb = 10] {}
# <- meta.command.nu keyword.declaration.nu
#   ^^^ meta.command.nu meta.parameters.nu entity.name.command.nu
#       ^ meta.command.nu meta.parameters.nu punctuation.section.group.begin.nu
#        ^^^ meta.command.nu meta.parameters.nu variable.parameter.nu
#            ^ meta.command.nu meta.parameters.nu keyword.operator.assignment.nu
#              ^^ meta.command.nu meta.parameters.nu constant.numeric.integer.nu
#                ^ meta.command.nu meta.parameters.nu punctuation.section.group.end.nu
#                  ^ meta.command.nu meta.block.nu punctuation.section.block.begin.nu
#                   ^ meta.command.nu meta.block.nu punctuation.section.block.end.nu

def aaa [bbb?] {}
# <- meta.command.nu keyword.declaration.nu
#   ^^^ meta.command.nu meta.parameters.nu entity.name.command.nu
#       ^ meta.command.nu meta.parameters.nu punctuation.section.group.begin.nu
#        ^^^ meta.command.nu meta.parameters.nu variable.parameter.nu
#           ^ meta.command.nu meta.parameters.nu keyword.operator.optional.nu
#            ^ meta.command.nu meta.parameters.nu punctuation.section.group.end.nu
#              ^ meta.command.nu meta.block.nu punctuation.section.block.begin.nu
#               ^ meta.command.nu meta.block.nu punctuation.section.block.end.nu

def aaa [...bbb] {}
# <- meta.command.nu keyword.declaration.nu
#   ^^^ meta.command.nu meta.parameters.nu entity.name.command.nu
#       ^ meta.command.nu meta.parameters.nu punctuation.section.group.begin.nu
#        ^^^ meta.command.nu meta.parameters.nu keyword.operator.spread.nu
#           ^^^ meta.command.nu meta.parameters.nu variable.parameter.nu
#              ^ meta.command.nu meta.parameters.nu punctuation.section.group.end.nu
#                ^ meta.command.nu meta.block.nu punctuation.section.block.begin.nu
#                 ^ meta.command.nu meta.block.nu punctuation.section.block.end.nu

def aaa [
  a: string@foo # bar
#    ^^^^^^ meta.command.nu meta.parameters.nu storage.type.nu
#          ^ meta.command.nu meta.parameters.nu meta.function.completion.nu keyword.operator.completion.nu
#           ^^^ meta.command.nu meta.parameters.nu meta.function.completion.nu string.bare.nu
#               ^ meta.command.nu meta.parameters.nu comment.line.number-sign.nu
#                ^^^^ meta.command.nu meta.parameters.nu comment.line.nu
  a: string@'foo' # bar
#    ^^^^^^ meta.command.nu meta.parameters.nu storage.type.nu
#          ^ meta.command.nu meta.parameters.nu meta.function.completion.nu keyword.operator.completion.nu
#           ^ meta.command.nu meta.parameters.nu meta.function.completion.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.begin.nu
#            ^^^ meta.command.nu meta.parameters.nu meta.function.completion.nu meta.string.nu string.quoted.single.nu
#               ^ meta.command.nu meta.parameters.nu meta.function.completion.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.end.nu
#                 ^ meta.command.nu meta.parameters.nu comment.line.number-sign.nu
#                  ^^^^ meta.command.nu meta.parameters.nu comment.line.nu
  a: string@foo,
#              ^ meta.command.nu meta.parameters.nu punctuation.separator.parameter.nu
  a: list<string>
#    ^^^^ meta.command.nu meta.parameters.nu storage.type.nu
#        ^ meta.command.nu meta.parameters.nu punctuation.definition.type.begin.nu
#         ^^^^^^ meta.command.nu meta.parameters.nu storage.type.nu
#               ^ meta.command.nu meta.parameters.nu punctuation.definition.type.end.nu
  a: record<foo: string, 'bar': int>
#    ^^^^^^ meta.command.nu meta.parameters.nu storage.type.nu
#          ^ meta.command.nu meta.parameters.nu punctuation.definition.type.begin.nu
#           ^^^ meta.command.nu meta.parameters.nu entity.name.label.nu
#              ^ meta.command.nu meta.parameters.nu punctuation.separator.key-value.nu
#                ^^^^^^ meta.command.nu meta.parameters.nu storage.type.nu
#                      ^ meta.command.nu meta.parameters.nu punctuation.separator.type.nu
#                        ^ meta.command.nu meta.parameters.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.begin.nu
#                         ^^^ meta.command.nu meta.parameters.nu meta.string.nu string.quoted.single.nu
#                            ^ meta.command.nu meta.parameters.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.end.nu
#                             ^ meta.command.nu meta.parameters.nu punctuation.separator.key-value.nu
#                               ^^^ meta.command.nu meta.parameters.nu storage.type.nu
#                                  ^ meta.command.nu meta.parameters.nu punctuation.definition.type.end.nu

  a = foo
#   ^ meta.command.nu meta.parameters.nu keyword.operator.assignment.nu
#     ^^^ meta.command.nu meta.parameters.nu string.bare.nu
  a: range = 1..3
#    ^^^^^ meta.command.nu meta.parameters.nu storage.type.nu
#          ^ meta.command.nu meta.parameters.nu keyword.operator.assignment.nu
#            ^^^^ meta.command.nu meta.parameters.nu constant.range.nu
  a: string1
#    ^^^^^^^ meta.command.nu meta.parameters.nu - storage.type.nu
] {}

##
# Extern
##

extern "aaa\"bbb" [
# <- meta.extern.nu keyword.extern.nu
#      ^ meta.extern.nu entity.name.extern.nu entity.name.extern.begin.nu
#          ^^ meta.extern.nu entity.name.extern.nu constant.character.escape.nu
#               ^ meta.extern.nu entity.name.extern.nu entity.name.extern.end.nu
#                 ^ meta.extern.nu meta.parameters.nu punctuation.section.group.begin.nu
  foo: string
# ^ meta.extern.nu meta.parameters.nu variable.parameter.nu
#    ^ meta.extern.nu meta.parameters.nu punctuation.separator.type.nu
#      ^^^^^^ meta.extern.nu meta.parameters.nu storage.type.nu
  foo?: string
#    ^ meta.extern.nu meta.parameters.nu keyword.operator.optional.nu
#     ^ meta.extern.nu meta.parameters.nu punctuation.separator.type.nu
#       ^^^^^^ meta.extern.nu meta.parameters.nu storage.type.nu
  --foo
# ^^^^^ meta.extern.nu meta.parameters.nu variable.parameter.long.nu
  --foo: string
# ^^^^^ meta.extern.nu meta.parameters.nu variable.parameter.long.nu
#      ^ meta.extern.nu meta.parameters.nu punctuation.separator.type.nu
#        ^^^^^^ meta.extern.nu meta.parameters.nu storage.type.nu
  --foo(-f): string
# ^^^^^ meta.extern.nu meta.parameters.nu variable.parameter.long.nu
#       ^^ meta.extern.nu meta.parameters.nu variable.parameter.short.nu
#          ^ meta.extern.nu meta.parameters.nu punctuation.separator.type.nu
#            ^^^^^^ meta.extern.nu meta.parameters.nu storage.type.nu
  -a: string
# ^^ meta.extern.nu meta.parameters.nu variable.parameter.short.nu
#     ^^^^^^ meta.extern.nu meta.parameters.nu storage.type.nu
]
# <- meta.extern.nu meta.parameters.nu punctuation.section.group.end.nu

extern-wrapped foo [foo: string, ...rest] {
# ^^^^^^^^^^^^ meta.extern-wrapped.nu keyword.extern-wrapped.nu
#              ^^^ meta.extern-wrapped.nu entity.name.extern.nu
#                  ^ meta.extern-wrapped.nu meta.parameters.nu punctuation.section.group.begin.nu
#                   ^^^ meta.extern-wrapped.nu meta.parameters.nu variable.parameter.nu
#                      ^ meta.extern-wrapped.nu meta.parameters.nu punctuation.separator.type.nu
#                        ^^^^^^ meta.extern-wrapped.nu meta.parameters.nu storage.type.nu
#                              ^ meta.extern-wrapped.nu meta.parameters.nu punctuation.separator.parameter.nu
#                                ^^^ meta.extern-wrapped.nu meta.parameters.nu keyword.operator.spread.nu
#                                   ^^^^ meta.extern-wrapped.nu meta.parameters.nu variable.parameter.nu
#                                       ^ meta.extern-wrapped.nu meta.parameters.nu punctuation.section.group.end.nu
#                                         ^ meta.closure.nu punctuation.section.closure.begin.nu
  bar $rest
# ^^^ meta.closure.nu meta.function-call.identifier.nu variable.function.nu
#     ^^^^^ meta.closure.nu meta.function-call.arguments.nu variable.other.nu
}
# <- meta.closure.nu punctuation.section.closure.end.nu

##
# Function Call
##

func foo -a --bar - 1
# <- meta.function-call.identifier.nu variable.function.nu
#    ^^^ meta.function-call.arguments.nu string.bare.nu
#        ^^ meta.function-call.arguments.nu string.flag.short.nu
#           ^^^^^ meta.function-call.arguments.nu string.flag.long.nu
#                 ^ meta.function-call.arguments.nu string.flag.short.nu
#                   ^ meta.function-call.arguments.nu constant.numeric.integer.nu

path expand $foo
# ^^^^^^^^^ meta.function-call.identifier.nu support.function.nu
#           ^^^^ variable.other.nu

foo; bar
# <- meta.function-call.identifier.nu variable.function.nu
#  ^ punctuation.terminator.statement.nu
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
# Output redirection
##

foo bar out> output_file
# <- meta.function-call.identifier.nu variable.function.nu
#   ^^^ meta.function-call.arguments.nu string.bare.nu
#       ^^^^ meta.function-call.arguments.nu keyword.other.redirect.nu
#            ^^^^^^^^^^^ meta.function-call.arguments.nu string.bare.nu

##
# Special statements
##

alias c = foo bar
# <- keyword.other.nu
#     ^ variable.name.nu
#       ^ keyword.operator.assignment.nu
#         ^^^ meta.function-call.identifier.nu variable.function.nu
#             ^^^ meta.function-call.arguments.nu string.bare.nu

alias lsname = (ls | get name)
# <- keyword.other.nu
#     ^^^^^^ variable.name.nu
#            ^ keyword.operator.assignment.nu
#              ^ meta.group.nu punctuation.section.group.begin.nu
#                  ^ meta.group.nu keyword.operator.pipe.nu
#                    ^^^ meta.group.nu meta.function-call.identifier.nu support.function.nu
#                        ^^^^ meta.group.nu meta.function-call.arguments.nu string.bare.nu
#                            ^ meta.group.nu punctuation.section.group.end.nu

export alias c = foo
# ^^^^^^^^^^ keyword.other.nu
#            ^ variable.name.nu
#              ^ keyword.operator.assignment.nu
#                ^^^ meta.function-call.identifier.nu variable.function.nu

overlay use foo --prefix as bar --reload
# <- keyword.operator.nu
#           ^^^ string.bare.nu
#               ^^^^^^^^ string.flag.long.nu
#                        ^^ keyword.operator.nu
#                           ^^^ string.bare.nu
#                               ^^^^^^^^ string.flag.long.nu

where foo | null
# <- meta.function-call.identifier.nu support.function.nu
#     ^^^ meta.function-call.arguments.row-condition.nu variable.name.nu
#         ^ keyword.operator.pipe.nu
#           ^^^^ source.shell.nu constant.language.null.nu

where foo == bar and foo == bar | null
# <- meta.function-call.identifier.nu support.function.nu
#     ^^^ meta.function-call.arguments.row-condition.nu variable.name.nu
#         ^^ meta.function-call.arguments.row-condition.nu keyword.operator.nu
#            ^^^ meta.function-call.arguments.row-condition.nu string.bare.nu
#                ^^^ meta.function-call.arguments.row-condition.nu keyword.operator.nu
#                    ^^^ meta.function-call.arguments.row-condition.nu variable.name.nu
#                        ^^ meta.function-call.arguments.row-condition.nu keyword.operator.nu
#                           ^^^ meta.function-call.arguments.row-condition.nu string.bare.nu
#                               ^ keyword.operator.pipe.nu
#                                 ^^^^ source.shell.nu constant.language.null.nu

where size > 10kb and size < 100kb | null
# <- meta.function-call.identifier.nu support.function.nu
#     ^^^^ meta.function-call.arguments.row-condition.nu variable.name.nu
#          ^ meta.function-call.arguments.row-condition.nu keyword.operator.nu
#            ^^^^ meta.function-call.arguments.row-condition.nu constant.file-size.nu
#                 ^^^ meta.function-call.arguments.row-condition.nu keyword.operator.nu
#                     ^^^^ meta.function-call.arguments.row-condition.nu variable.name.nu
#                          ^ meta.function-call.arguments.row-condition.nu keyword.operator.nu
#                            ^^^^^ meta.function-call.arguments.row-condition.nu constant.file-size.nu
#                                  ^ keyword.operator.pipe.nu
#                                    ^^^^ source.shell.nu constant.language.null.nu

(where foo == bar)
# <- meta.group.nu punctuation.section.group.begin.nu
# ^^^^ meta.group.nu meta.function-call.identifier.nu support.function.nu
#      ^^^ meta.group.nu meta.function-call.arguments.row-condition.nu variable.name.nu
#          ^^ meta.group.nu meta.function-call.arguments.row-condition.nu keyword.operator.nu
#             ^^^ meta.group.nu meta.function-call.arguments.row-condition.nu string.bare.nu
#                ^ meta.group.nu punctuation.section.group.end.nu
let foo = bar
# <- keyword.other.nu
#   ^^^ variable.name.nu
#       ^ keyword.operator.assignment.nu
#         ^^^ meta.function-call.identifier.nu variable.function.nu

foo where
# <- meta.function-call.identifier.nu variable.function.nu
#   ^^^^^ meta.function-call.arguments.nu string.bare.nu

##
# If
##

if is-admin { echo a } else if false { echo b } else { echo c }
# <- keyword.control.conditional.if.nu
#  ^^^^^^^^ meta.function-call.identifier.nu keyword.other.nu
#           ^ meta.block.nu punctuation.section.block.begin.nu
#             ^^^^ meta.block.nu meta.function-call.identifier.nu keyword.other.nu
#                  ^ meta.block.nu meta.function-call.arguments.nu string.bare.nu
#                    ^ meta.block.nu punctuation.section.block.end.nu
#                      ^^^^^^^ keyword.control.conditional.elseif.nu
#                              ^^^^^ constant.language.boolean.false.nu
#                                    ^ meta.block.nu punctuation.section.block.begin.nu
#                                      ^^^^ meta.block.nu meta.function-call.identifier.nu keyword.other.nu
#                                           ^ meta.block.nu meta.function-call.arguments.nu string.bare.nu
#                                             ^ meta.block.nu punctuation.section.block.end.nu
#                                               ^^^^ keyword.control.conditional.else.nu
#                                                    ^ meta.block.nu punctuation.section.block.begin.nu
#                                                      ^^^^ meta.block.nu meta.function-call.identifier.nu keyword.other.nu
#                                                           ^ meta.block.nu meta.function-call.arguments.nu string.bare.nu
#                                                             ^ meta.block.nu punctuation.section.block.end.nu

let a = (
#       ^ meta.group.nu punctuation.section.group.begin.nu
  if false {
# ^^ meta.group.nu keyword.control.conditional.if.nu
#    ^^^^^ meta.group.nu constant.language.boolean.false.nu
#          ^ meta.group.nu meta.block.nu punctuation.section.block.begin.nu
    1
#   ^ meta.group.nu meta.block.nu constant.numeric.integer.nu
  } else if false {
# ^ meta.group.nu meta.block.nu punctuation.section.block.end.nu
#   ^^^^^^^ meta.group.nu keyword.control.conditional.elseif.nu
#           ^^^^^ meta.group.nu constant.language.boolean.false.nu
#                 ^ meta.group.nu meta.block.nu punctuation.section.block.begin.nu
    2
#   ^ meta.group.nu meta.block.nu constant.numeric.integer.nu
  } else {
# ^ meta.group.nu meta.block.nu punctuation.section.block.end.nu
#   ^^^^ meta.group.nu keyword.control.conditional.else.nu
#        ^ meta.group.nu meta.block.nu punctuation.section.block.begin.nu
    3
#   ^ meta.group.nu meta.block.nu constant.numeric.integer.nu
  }
# ^ meta.group.nu meta.block.nu punctuation.section.block.end.nu
)
# <- meta.group.nu punctuation.section.group.end.nu

##
# Match
##

match 1 {
# ^^^ keyword.control.match.nu
#     ^ constant.numeric.integer.nu
#       ^ punctuation.section.match.begin.nu
  1 => { 'foo' }
# ^ constant.numeric.integer.nu
#   ^^ keyword.operator.arrow.nu
#      ^ meta.block.nu punctuation.section.block.begin.nu
#        ^ meta.block.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.begin.nu
#              ^ meta.block.nu punctuation.section.block.end.nu
  1..10 => { 'foo' }
# ^^^^^ constant.range.nu
#       ^^ keyword.operator.arrow.nu
#          ^ meta.block.nu punctuation.section.block.begin.nu
#            ^ meta.block.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.begin.nu
#                  ^ meta.block.nu punctuation.section.block.end.nu
  [$head, ..$tail] => { 'foo' }
# ^ punctuation.section.list.begin.nu
#  ^^^^ variable.other.nu
#       ^ punctuation.separator.comma.nu
#         ^^ operator.spread.nu
#           ^^^^^ variable.other.nu
#                ^ punctuation.section.list.end.nu
#                  ^^ keyword.operator.arrow.nu
#                     ^ meta.block.nu punctuation.section.block.begin.nu
#                       ^ meta.block.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.begin.nu
#                             ^ meta.block.nu punctuation.section.block.end.nu
  {a: $a, b: 2} => { 'foo' }
# ^ meta.record.nu punctuation.section.record.begin.nu
#  ^ meta.record.nu entity.name.label.nu
#   ^ meta.record.nu punctuation.separator.key-value.nu
#     ^^ meta.record.nu variable.other.nu
#       ^ meta.record.nu punctuation.separator.comma.nu
#         ^ meta.record.nu entity.name.label.nu
#          ^ meta.record.nu punctuation.separator.key-value.nu
#            ^ meta.record.nu constant.numeric.integer.nu
#             ^ meta.record.nu punctuation.section.record.end.nu
#               ^^ keyword.operator.arrow.nu
#                  ^ meta.block.nu punctuation.section.block.begin.nu
#                    ^ meta.block.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.begin.nu
#                          ^ meta.block.nu punctuation.section.block.end.nu
#
  x if $x == 1 => { 'foo' },
# ^ variable.name.nu
#   ^^ keyword.control.conditional.if.nu
#      ^^ variable.other.nu
#         ^^ keyword.operator.nu
#            ^ constant.numeric.integer.nu
#              ^^ keyword.operator.arrow.nu
#                 ^ meta.block.nu punctuation.section.block.begin.nu
#                   ^ meta.block.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.begin.nu
#                         ^ meta.block.nu punctuation.section.block.end.nu
  _ => { 'foo' }
# ^ variable.name.nu
#   ^^ keyword.operator.arrow.nu
#      ^ meta.block.nu punctuation.section.block.begin.nu
#        ^ meta.block.nu meta.string.nu string.quoted.single.nu punctuation.definition.string.begin.nu
#              ^ meta.block.nu punctuation.section.block.end.nu
}

##
# Loop
##

loop {
# ^^ keyword.control.loop.nu
#    ^ meta.block.nu punctuation.section.block.begin.nu
  aaa |
# ^^^ meta.block.nu meta.function-call.identifier.nu variable.function.nu
#     ^ meta.block.nu keyword.operator.pipe.nu
    bbb
#   ^^^ meta.block.nu meta.function-call.identifier.nu variable.function.nu
}
# <- meta.block.nu punctuation.section.block.end.nu

loop { break }
# ^^ keyword.control.loop.nu
#    ^ meta.block.nu punctuation.section.block.begin.nu
#      ^^^^^ meta.block.nu meta.function-call.identifier.nu keyword.other.nu
#            ^ meta.block.nu

##
# While
##

while $x < 10 {
# <- keyword.control.loop.while.nu
#     ^^ variable.other.nu
#        ^ keyword.operator.nu
#          ^^ constant.numeric.integer.nu
#             ^ meta.block.nu punctuation.section.block.begin.nu
  $x = $x + 1
# ^^ meta.block.nu variable.name.nu
#    ^ meta.block.nu keyword.operator.assignment.nu
#      ^^ meta.block.nu variable.other.nu
#         ^ meta.block.nu keyword.operator.nu
#           ^ meta.block.nu constant.numeric.integer.nu
}
# <- meta.block.nu punctuation.section.block.end.nu

##
# For loop
##

for i in 1..10 { print $i }
# ^ keyword.control.loop.for.nu
#   ^ variable.name.nu
#     ^^ keyword.control.loop.in.nu
#        ^^^^^ constant.range.nu
#              ^ meta.block.nu punctuation.section.block.begin.nu
#                ^^^^^ meta.block.nu meta.function-call.identifier.nu support.function.nu
#                      ^^ meta.block.nu meta.function-call.arguments.nu variable.other.nu
#                         ^ meta.block.nu punctuation.section.block.end.nu

##
# Try
##

try {
# <- keyword.control.exception.try.nu
  aaa
# ^^^ meta.block.nu meta.function-call.identifier.nu variable.function.nu
} catch {
# ^^^^^ keyword.control.exception.catch.nu
  bbb
# ^^^ meta.block.nu meta.function-call.identifier.nu variable.function.nu
}
# <- meta.block.nu punctuation.section.block.end.nu

##
# with-env
##

with-env [A B] { foo }
# ^^^^^^ keyword.other.nu
#        ^ meta.list-table.nu punctuation.section.list-table.begin.nu
#         ^ meta.list-table.nu string.bare.nu
#           ^ meta.list-table.nu string.bare.nu
#            ^ meta.list-table.nu punctuation.section.list-table.end.nu
#              ^ meta.block.nu punctuation.section.block.begin.nu
#                ^^^ meta.block.nu meta.function-call.identifier.nu variable.function.nu
#                    ^ meta.block.nu punctuation.section.block.end.nu

with-env [[A B]; [C D]] { foo }
# ^^^^^^ keyword.other.nu
#        ^ meta.list-table.nu punctuation.section.list-table.begin.nu
#         ^ meta.list-table.nu meta.list-table.nu punctuation.section.list-table.begin.nu
#          ^ meta.list-table.nu meta.list-table.nu string.bare.nu
#            ^ meta.list-table.nu meta.list-table.nu string.bare.nu
#             ^ meta.list-table.nu meta.list-table.nu punctuation.section.list-table.end.nu
#              ^ meta.list-table.nu punctuation.terminator.header.nu
#                ^ meta.list-table.nu meta.list-table.nu punctuation.section.list-table.begin.nu
#                 ^ meta.list-table.nu meta.list-table.nu string.bare.nu
#                   ^ meta.list-table.nu meta.list-table.nu string.bare.nu
#                    ^ meta.list-table.nu meta.list-table.nu punctuation.section.list-table.end.nu
#                     ^ meta.list-table.nu punctuation.section.list-table.end.nu
#                       ^ meta.block.nu punctuation.section.block.begin.nu
#                         ^^^ meta.block.nu meta.function-call.identifier.nu variable.function.nu
#                             ^ meta.block.nu punctuation.section.block.end.nu

with-env {A: B, C: D} { foo }
# ^^^^^^ keyword.other.nu
#        ^ meta.record.nu punctuation.section.record.begin.nu
#         ^ meta.record.nu entity.name.label.nu
#          ^ meta.record.nu punctuation.separator.key-value.nu
#            ^ meta.record.nu string.bare.nu
#             ^ meta.record.nu punctuation.separator.comma.nu
#               ^ meta.record.nu entity.name.label.nu
#                ^ meta.record.nu punctuation.separator.key-value.nu
#                  ^ meta.record.nu string.bare.nu
#                   ^ meta.record.nu punctuation.section.record.end.nu
#                     ^ meta.block.nu punctuation.section.block.begin.nu
#                       ^^^ meta.block.nu meta.function-call.identifier.nu variable.function.nu
#                           ^ meta.block.nu punctuation.section.block.end.nu

##
# Pipelines
##

# Spaces aren't needed
aaa 1|bbb|ccc 2
# <- meta.function-call.identifier.nu variable.function.nu
#   ^ meta.function-call.arguments.nu constant.numeric.integer.nu
#    ^ keyword.operator.pipe.nu
#     ^^^ meta.function-call.identifier.nu variable.function.nu
#        ^ keyword.operator.pipe.nu
#         ^^^ meta.function-call.identifier.nu variable.function.nu
#             ^ meta.function-call.arguments.nu constant.numeric.integer.nu

##
# Subexpressions
##

(aaa 1 | bbb | ccc 2)
# <- punctuation.section.group.begin.nu
# ^^ meta.function-call.identifier.nu variable.function.nu
#    ^ meta.group.nu meta.function-call.arguments.nu constant.numeric.integer.nu
#      ^ keyword.operator.pipe.nu
#        ^^^ meta.function-call.identifier.nu variable.function.nu
#            ^ keyword.operator.pipe.nu
#              ^^^ meta.function-call.identifier.nu variable.function.nu
#                  ^ meta.group.nu meta.function-call.arguments.nu constant.numeric.integer.nu
#                   ^ meta.group.nu punctuation.section.group.end.nu

((aaa 1))
# <- meta.group.nu punctuation.section.group.begin.nu
#^ meta.group.nu meta.group.nu punctuation.section.group.begin.nu
# ^^^ meta.group.nu meta.group.nu meta.function-call.identifier.nu variable.function.nu
#     ^ meta.group.nu meta.group.nu meta.function-call.arguments.nu constant.numeric.integer.nu
#      ^ meta.group.nu meta.group.nu punctuation.section.group.end.nu
#       ^ meta.group.nu punctuation.section.group.end.nu

(not aaa)
# <- meta.group.nu punctuation.section.group.begin.nu
# ^^ meta.group.nu keyword.operator.nu
#    ^^^ meta.group.nu meta.function-call.identifier.nu variable.function.nu
#       ^ meta.group.nu punctuation.section.group.end.nu

(FOO=BAR $env.FOO)
# <- meta.group.nu punctuation.section.group.begin.nu
# ^^ meta.group.nu variable.name.nu
#   ^ meta.group.nu keyword.operator.assignment.nu
#    ^^^ meta.environment-value.nu string.bare.nu
#        ^^^^ meta.group.nu variable.language.nu
#            ^ meta.group.nu punctuation.accessor.nu
#             ^^^ meta.group.nu meta.property.nu
#                ^ meta.group.nu punctuation.section.group.end.nu

(FOO=$'$(foo)bar' $env.FOO)
# <- meta.group.nu punctuation.section.group.begin.nu
# ^^ meta.group.nu variable.name.nu
#   ^ meta.group.nu keyword.operator.assignment.nu
#    ^^ meta.group.nu meta.string.interpolated.nu string.interpolated.single.nu punctuation.definition.string.interpolated.begin.nu
#      ^^^^^^^^^^ meta.group.nu meta.string.interpolated.nu string.interpolated.single.nu
#        ^^^ meta.group.nu meta.function-call.identifier.nu variable.function.nu
#               ^ punctuation.definition.string.interpolated.end.nu
#                 ^^^^ meta.group.nu variable.language.nu
#                     ^ meta.group.nu punctuation.accessor.nu
#                      ^^^ meta.group.nu meta.property.nu
#                         ^ meta.group.nu punctuation.section.group.end.nu

(try { foo } catch { null })
# <- meta.group.nu punctuation.section.group.begin.nu
# ^^ meta.group.nu keyword.control.exception.try.nu
#    ^ meta.group.nu meta.block.nu punctuation.section.block.begin.nu
#      ^^^ meta.group.nu meta.block.nu meta.function-call.identifier.nu variable.function.nu
#          ^ meta.group.nu meta.block.nu punctuation.section.block.end.nu
#            ^^^^^ meta.group.nu keyword.control.exception.catch.nu
#                  ^ meta.group.nu meta.block.nu punctuation.section.block.begin.nu
#                    ^^^^ meta.group.nu meta.block.nu constant.language.null.nu
#                         ^ meta.group.nu meta.block.nu punctuation.section.block.end.nu
#                          ^ meta.group.nu punctuation.section.group.end.nu

##
# Properties
##

$var.1.bar
# <- variable.other.nu
#   ^ punctuation.accessor.nu
#    ^ meta.property.nu
#     ^ punctuation.accessor.nu
#      ^^^ meta.property.nu

(aaa).foo.bar
# <- meta.group.nu punctuation.section.group.begin.nu
# ^^ meta.group.nu meta.function-call.identifier.nu variable.function.nu
#   ^ meta.group.nu punctuation.section.group.end.nu
#    ^ punctuation.accessor.nu
#     ^^^ meta.property.nu
#        ^ punctuation.accessor.nu
#         ^^^ meta.property.nu
