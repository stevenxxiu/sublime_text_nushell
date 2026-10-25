# Changelog
All notable changes to this project will be documented in this file

[unreleased]: https://github.com/stevenxxiu/sublime_text_nushell/compare/v1.11.5...HEAD
## [Unreleased]
<!-- - ✨ __Added__ -->
  <!-- + new features -->
<!-- - Δ __Changed__ -->
  <!-- + changes in existing functionality -->
<!-- - 🐞 __Fixed__ -->
  <!-- + bug fixes -->
<!-- - 💩 __Deprecated__ -->
  <!-- + soon-to-be removed features -->
<!-- - 🗑️ __Removed__ -->
  <!-- + now removed features -->
<!-- - 🔒 __Security__ -->
  <!-- + vulnerabilities -->

[v1.11.5]: https://github.com/stevenxxiu/sublime_text_nushell/releases/tag/v1.11.5
## [v1.11.5]
- 🐞 __Fixed__
  + line continuation breaking breaking inside group

[v1.11.4]: https://github.com/stevenxxiu/sublime_text_nushell/releases/tag/v1.11.4
## [v1.11.4]
- 🐞 __Fixed__
  + remove stray debug scopes

[v1.11.3]: https://github.com/stevenxxiu/sublime_text_nushell/releases/tag/v1.11.3
## [v1.11.3]
- 🐞 __Fixed__
  + attempt at trying to have a helpful error message after binary operator. In current syntax it's ambiguous with other names that are valid (starting with 'or' etc)

[v1.11.2]: https://github.com/stevenxxiu/sublime_text_nushell/releases/tag/v1.11.2
## [v1.11.2]
- 🗑️ __Removed__
  + rules incompatible with the faster v2 regex engine

[v1.11.1]: https://github.com/stevenxxiu/sublime_text_nushell/releases/tag/v1.11.1
## [v1.11.1]

- ✨ __Added__
  + support for command type signatures `def cmd []: oneof< table<type: int, bar: float>, int, string> -> record<type: int, bar: string> { mut $o = {type:0,bar:'b'}; $o}`
- 🐞 __Fixed__
  + match results only accepting blocks, not single expressions

[v1.11.0]: https://github.com/stevenxxiu/sublime_text_nushell/releases/tag/v1.11.0
## [v1.11.0]
