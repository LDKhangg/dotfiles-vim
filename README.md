# dotfiles-vim

Personal editor config for:

- Neovim: `.config/nvim`
- IdeaVim: `.ideavimrc`
- IntelliJ IDEA settings related to Vim/completion/keymap:
  - `.config/JetBrains/IntelliJIdea2026.1/options/editor.xml`
  - `.config/JetBrains/IntelliJIdea2026.1/options/vim_settings.xml`
  - `.config/JetBrains/IntelliJIdea2026.1/keymaps/GNOME Proper Redo.xml`

## Notes

- `vim_settings_local.xml` is intentionally excluded because it contains local jump/mark state.
- Neovim is kept generic for everyday editing and language learning.
- Java-specific IDE workflow is expected to live in IntelliJ + IdeaVim.

## Restore

Copy the files back to the same paths under `$HOME`.

Examples:

```bash
cp -a .config/nvim ~/.config/
cp .ideavimrc ~/.ideavimrc
cp .config/JetBrains/IntelliJIdea2026.1/options/editor.xml ~/.config/JetBrains/IntelliJIdea2026.1/options/
cp .config/JetBrains/IntelliJIdea2026.1/options/vim_settings.xml ~/.config/JetBrains/IntelliJIdea2026.1/options/
cp ".config/JetBrains/IntelliJIdea2026.1/keymaps/GNOME Proper Redo.xml" ~/.config/JetBrains/IntelliJIdea2026.1/keymaps/
```
