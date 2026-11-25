```text
  ██  ██ ██████ ██████ ██  ██
  ██  ██   ██     ██   ██  ██    YouTube in your terminal.
   ████    ██     ██    ████
    ██     ██     ██     ██     ▶ ytty --search 'Me at the zoo'
    ██     ██     ██     ██
```

# ytty

Search and play YouTube in your terminal.

```text
Search: Me at the zoo

   1  Me at the zoo
      jawed  |  19
   2  Me at the zoo but it's expanded with AI (Runway Gen-3 Alpha)
      Jake Whitfield  |  11
   3  Me at the zoo - 8K meme
      Remas  |  26
   4  [ Me at the zoo ] where is Jawed Karim in 2026?
      Info-Beast  |  3:33
   5  Me at the zoo - 360° VR Video
      Multiverse 360VR  |  19

Number to play  |  m more  |  s new search  |  q / Enter quit
>
```

## Quick start

Install `mpv` and `yt-dlp` (2026.11.23 or newer). Use a terminal with Kitty graphics support.

```sh
export PATH="/path/to/ytty/bin:$PATH"
```

On macOS, `ytty-ghostty` needs Ghostty 1.3 or newer. It opens a window by default; add `--split` to play beside your current terminal.

```sh
ytty-ghostty --split --id jNQXAC9IVRw
```

See `ytty --help` and `ytty-ghostty --help` for more commands. For agent use, install the [YouTube skill](skills/youtube/SKILL.md) and put `ytty-ghostty` on the agent's `PATH`.

If YouTube asks you to sign in, set `YTTY_COOKIES_FROM_BROWSER` to a browser where you're already signed in, for example `export YTTY_COOKIES_FROM_BROWSER=firefox`. For other playback problems, try `--no-fast`.
