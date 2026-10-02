# dotfiles

Backup of `~/.config` on `ketchup` (Ubuntu + i3). Goal: if this laptop dies or
gets wiped, cloning this repo plus running a couple of scripts gets me back to
a working desktop with minimal manual reconstruction.

Repo root = `~/.config`. Everything tracked here is meant to be symlinked (or
copied) back into `~/.config` on restore.

## What's tracked

Tracked: the actual desktop stack — `i3/`, `polybar/`, `kitty/`, `dunst/`,
`rofi/`, `tmux/`, `nvim/`, `ranger/`, `rclone/`, and the `xfce4/`

## `extra/`

Some things needed to fully restore this machine don't live in `~/.config` at
all — installed packages, and scripts referenced by i3/polybar/tmux configs
that normally live in `~/bin` or `~/.local/bin`. Since the repo root is
`~/.config`, those have no natural home inside it, so `extra/` is a
deliberate holding area for copies of them.

These are **snapshots, not live links**. Nothing here auto-updates when the
real files change — that's the tradeoff for keeping the repo root at
`~/.config` instead of `~/`. Run `extra/regenerate.sh` before each commit to
refresh them, or the backup will silently drift stale.

- **`packages.txt`** — full output of `dpkg --get-selections`. Every package
  on the system, including every dependency. This is the complete historical
  snapshot, useful for diffing what changed over time, but not what you want
  to hand to `apt install` on a fresh machine (it'll try to reinstall
  hundreds of transitive deps as if they were manual choices).

- **`manual-packages.txt`** — output of `apt-mark showmanual`. Only packages
  *I* explicitly installed, not their dependencies. This is the one to
  actually use for restore:
  ```
  sudo apt install $(cat extra/manual-packages.txt)
  ```

- **`scripts/`** — mirror of `~/bin` (or `~/.local/bin`, whichever is
  populated) — custom scripts that polybar click-handlers, i3 keybinds, or
  tmux call out to by absolute path. These live outside `~/.config` on the
  real system; this is a copy for backup, restored by copying back and
  re-adding to `$PATH`.

- **`regenerate.sh`** — rebuilds everything above from the live system.
  Run it any time before pushing. See below.

## Fresh-machine restore (rough order)

1. Install i3, kitty, polybar, dunst, picom, rofi, xss-lock, i3lock,
   xfce4-power-manager, tmux, nvim, ranger, rclone.
2. Clone this repo, symlink each tracked directory into `~/.config/`.
3. `sudo apt install $(cat extra/manual-packages.txt)`
4. Copy `extra/scripts/` back to `~/bin`, ensure it's on `$PATH`.
5. Open tmux — the bootstrap snippet in `tmux.conf` clones TPM automatically
   and `prefix + I` pulls the rest of the plugins.

## Known open issues (as of last audit)

- None