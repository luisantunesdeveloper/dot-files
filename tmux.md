# TMUX config
A configuration example is provided in tmux.conf.  

## install tmux
`brew install tmux`  

## install tmuxinator to used to automatically create windows and panes in tmux with YAML files
[tmuxinator](https://github.com/tmuxinator/tmuxinator "tmuxinator")

# Start tmux (https://gitlab.com/gnachman/iterm2/wikis/TmuxIntegration)
Run `tmux -CC` or `tmux -CC attach` in iTerm2 and then menu is shown on terminal:
- ESC to detach
- C to run commands
- X to force quit
- L for log

# Control sessions
- `new -s session-name [-c working-dir] [shell-cmd]` alias for `new-session`
- `kill-session -t target-session`
- `rename [-t target-session] new-name` alias for `rename-session`
- `ls` alias for `list-sessions`
- `attach -t target-session [-c working-dir]` alias for `attach-session`

## target-session
- ID: `$1`
- name: `myse` or `=mysession` (exact match)

## Clients
- `lsc` alias for `list-clients`

## Windows
- `neww [-c working-dir] [-t target-window] -n window-name [shell-cmd]` alias for `new-window`
- `killw -t target-window` alias for `kill-window`
- `renamew -t target-window new-name` alias for `rename-window`
- `lsw -t target-session` alias for `list-windows`

## target-window
- specified in form: `session:window`, eg. `mysession:1`
- ID: `@1`
- name: `mysession:mywindow` / `mysession:mywin` / `mysession:=mywindow`

credits to: [source](https://gist.github.com/royling/eb723714eb7ce8ae1150b006698f9f3c#file-tmux-iterm2-md "source")

# TMUX shortcuts

## Common:
- `Ctrl-b`: prefix
- `?`: list key bindings
- `:`: command prompt
- `[`: enter copy mode
- `]`: paste

## Sessions:
- `$`: rename session
- `d`: detach current client
- `D`: choose client to detach

## Windows:
- `c`: create a window
- `0-9`: select window
- `&`: kill current window
- `,`: rename current window
- `p/n`: previous/next window

## Panes:
- `%`: horizontal split (current pane => left & right panes)
- `"`: vertical split
- `;/o`: previous/next pane
- `Up/Down/Left/Right`: move to above/below/left/right pane
- `!`: break current pane out of window
- `x`: kill current pane
- `{/}`: swap current pane with prev/next pane
- `Ctrl-Up/Down/Left/Right`: resize pane

credits to: [source](https://gist.github.com/royling/eb723713eb7ce8ae1150b006698f9f3c#file-tmux-shortcuts-md "source")
