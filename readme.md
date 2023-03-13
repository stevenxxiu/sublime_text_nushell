# Sublime Text Nushell Package
*Nushell* plugin for *Sublime Text*.

# Install

```sh
$ cd ~/.config/sublime-text/Packages/
$ git clone https://github.com/stevenxxiu/sublime_text_nushell Nushell
```

# Development Setup
To setup the project for development, run:

    $ cd Nushell/
    $ pre-commit install --hook-type pre-commit --hook-type commit-msg
    $ pre-commit run --all-files

To run tests in `syntax_test_nushell.nu`, open `nushell.sublime-syntax` and run `Ctrl + B` for `Build`.
