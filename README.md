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

## Setup

- [mpv](https://mpv.io/installation/)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp/wiki/Installation) 2026.11.23 or newer
- A terminal with Kitty graphics support
- [Ghostty](https://ghostty.org/) 1.3 or newer on macOS for `ytty-ghostty`

Add the checkout's `bin` directory to your `PATH`:

```sh
export PATH="/path/to/ytty/bin:$PATH"
```

## Use

```sh
ytty
ytty 'https://www.youtube.com/watch?v=jNQXAC9IVRw'
ytty-ghostty --split --id jNQXAC9IVRw
```

Pick a result by number. Use `m` for more results, `b` to go back, or `s` for a new search. Press `q` during playback to return to the search menu, then `q` or Enter to exit.

`ytty-ghostty` opens a window by default. Use `--tab` for a tab or `--split` to play beside your current Ghostty terminal. If the caller has no matching Ghostty terminal, `--split` uses the focused terminal in Ghostty's front window. See `ytty --help` and `ytty-ghostty --help` for more commands.

For agent use, install the [YouTube skill](skills/youtube/SKILL.md) and put `ytty-ghostty` on the agent's `PATH`.

## Browser cookies (optional)

Fast mode starts without cookies. If YouTube asks you to sign in to confirm you're not a bot, it retries once with cookies from the browser you configured. Choose a browser where you're already signed in:

```sh
export YTTY_COOKIES_FROM_BROWSER=firefox
```

Try `--no-fast` if playback fails or you expected surround sound. It uses the configured cookies on the first attempt. Use `ytty --logs` to see mpv logs.
