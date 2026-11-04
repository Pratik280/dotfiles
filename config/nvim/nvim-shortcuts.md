## 1. General shortcuts

| Keybinding | Action                          |
| ---------- | ------------------------------- |
| `Ctrl + S` | Save the current file           |
| `Ctrl + Q` | Quit the current window         |
| `Ctrl + H` | Move to the window on the left  |
| `Ctrl + J` | Move to the window below        |
| `Ctrl + K` | Move to the window above        |
| `Ctrl + L` | Move to the window on the right |

## 2. File explorer — NvimTree

| Keybinding       | Action                          |
| ---------------- | ------------------------------- |
| `Space` then `e` | Toggle the file explorer on/off |

## 3. Telescope — search and navigation

These are your main shortcuts for finding files and searching your project.

| Keybinding                | Action                         |
| ------------------------- | ------------------------------ |
| `Space` then `f` then `f` | Find files                     |
| `Space` then `f` then `g` | Search text across the project |
| `Space` then `f` then `b` | List open buffers              |
| `Space` then `f` then `r` | Open recent files              |

Inside Telescope's interactive search window:

| Keybinding | Action              |
| ---------- | ------------------- |
| `Ctrl + J` | Move selection down |
| `Ctrl + K` | Move selection up   |

## 4. Commenting code

| Keybinding                                         | Action                             |
| -------------------------------------------------- | ---------------------------------- |
| `Space` then `/`                                   | Toggle comment on the current line |
| Select lines in Visual mode, then `Space` then `/` | Toggle comments on selected lines  |

These mappings use `Comment.nvim`. The `gcc` and `gc` commands are invoked through remapping.

## 5. Vimwiki — notes and diary

| Keybinding                | Action                                |
| ------------------------- | ------------------------------------- |
| `Space` then `w` then `1` | Open the first Vimwiki index          |
| `Space` then `w` then `2` | Open the second Vimwiki index         |
| `Space` then `w` then `t` | Sync today's diary TODOs to the index |

You also have a custom command:

| Command           | Action                    |
| ----------------- | ------------------------- |
| `:SyncDiaryTodos` | Sync diary TODOs manually |

The TODO sync works only if the configured diary and index paths exist and the index contains the `== Active TODOs ==` section.

## 6. Java — run your code

| Command        | Action                                                                                          |
| -------------- | ----------------------------------------------------------------------------------------------- |
| `:RunJavaCode` | Save the current file, open a vertical split, and run `javac *.java && java Main` in a terminal |

This is a custom command, not a keybinding. Your config doesn't assign a keyboard shortcut to it.

## 7. Other useful commands

| Command        | Action                                 |
| -------------- | -------------------------------------- |
| `:Lazy`        | Open the plugin manager                |
| `:Lazy sync`   | Synchronize plugins                    |
| `:checkhealth` | Check Neovim's health and dependencies |

These are Neovim commands, not custom mappings in your config.

## Quick cheat sheet

## Space e

Explorer

Open or close the file tree

## Space ff

Find files

Search filenames with Telescope

## Space fg

Search text

Find text throughout your project

## Space fr

Recent files

Reopen recently used files

## Space /

Toggle comment

Comment or uncomment code

## Ctrl S

Save

Write the current file

Note: Your Dashboard also displays shortcuts for Recent Files (`r`), Projects (`p`), New File (`n`), Neovim Config (`c`), Find Files (`f`), and Quit (`q`). Those are Dashboard menu actions, not global keybindings.
