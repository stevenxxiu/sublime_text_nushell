# SYNTAX TEST "Packages/Nushell/nushell.sublime-syntax"

def out_rec1 [...args: string] {}
#                      ^^^^^^                  meta.command.nu meta.parameters.nu
#                                              storage.type.nu
def out_rec [...args: string]: nothing -> nothing {}
#                            ^^^^^^^^^^^^^^^^^^^^^    meta.type.nu
#                            ^                        punctuation.separator.type-signature.nu
#                              ^^^^^^^                storage.type.nu
#                                      ^^             punctuation.separator.type-signature.nu
#                                         ^^^^^^^     storage.type.nu
#                                                 ^ - storage.type.nu
#                                                 ^   meta.block.nu punctuation.section.block.begin.nu
def out_rec [...args: string]: nothing -> nothing #
#                                                 ^   meta.type.nu invalid.illegal.type-signature.nu
{}
def out_rec [...args: string]: nothing -> nothing
#                                                ^    meta.type.nu invalid.illegal.muted.type-signature.nu
{}

def type_list1 []: list< int > -> list< string> { let $l = ["l"]; $l}
#                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        meta.type.nu
#                                               ^     - meta.type.nu
#                      ^                                punctuation.definition.type.begin.nu
#                            ^                          punctuation.definition.type.end.nu
#                                     ^                 punctuation.definition.type.begin.nu
#                                             ^         punctuation.definition.type.end.nu
#                  ^^^^                                 storage.type.list.nu
#                        ^^^                            storage.type.nu
#                                 ^^^^                  storage.type.list.nu
#                                       ^^^^^^          storage.type.nu
def type_list2 []: list< int > -> list < string> { let $l = ["l"]; $l}
#                                 ^^^^^^^^^^^^^^        meta.type.nu
#                                 ^^^^                  storage.type.list.nu
#                                        ^^^^^^         storage.type.nu
#                                     ^                 invalid.illegal.nu
def out_rec3 [...args: string]: oneof <nothing, int, string> -> record { mut $out = {rec:0}; $out}
#                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^   meta.type.nu
#                                    ^                                    invalid.illegal.nu

def out_rec3 [...args: string]: oneof<nothing, int, string> -> record { mut $out = {rec:0}; $out}
#                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    meta.type.nu
#                               ^^^^^                                     storage.type.union.nu keyword.declaration.union.nu
#                             ^                                           punctuation.separator.type-signature.nu
#                                    ^                                    punctuation.definition.type.begin.nu
#                                            ^                            punctuation.separator.type.nu
#                                                 ^                       punctuation.separator.type.nu
#                                                         ^               punctuation.definition.type.end.nu
#                                                           ^^            punctuation.separator.type-signature.nu
#                                     ^^^^^^^                             storage.type.nu
#                                              ^^^                        storage.type.nu
#                                                   ^^^^^^                storage.type.nu
#                                                              ^^^^^^     storage.type.nu

def out_rec4 [...args: string]: oneof< table<type: int, bar: float>, int, string> -> record<type: int, bar: string> { mut $out = {type:0,bar:'b'}; $out}
#                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    meta.type.nu
#                             ^                                                                                         punctuation.separator.type-signature.nu
#                                                ^                                                                      punctuation.separator.key-value.nu
#                                                          ^                                                            punctuation.separator.key-value.nu
#                                                                                               ^                       punctuation.separator.key-value.nu
#                                                                                                         ^             punctuation.separator.key-value.nu
#                                    ^                                                                                  punctuation.definition.type.begin.nu
#                                                                                          ^                            punctuation.definition.type.begin.nu
#                                                     ^                                                                 punctuation.separator.type.nu
#                                                                  ^                                                    punctuation.separator.type.nu
#                                                                       ^                                               punctuation.separator.type.nu
#                                                                                                    ^                  punctuation.separator.type.nu
#                                      ^^^^^                                                                            storage.type.table.nu
#                                                  ^^^                                                                  storage.type.nu
#                                                            ^^^^^                                                      storage.type.nu
#                                                                    ^^^                                                storage.type.nu
#                                                                         ^^^^^^                                        storage.type.nu
#                                                                                    ^^^^^^                             storage.type.record.nu
#                                                                                                 ^^^                   storage.type.nu
#                                                                                                           ^^^^^^      storage.type.nu
