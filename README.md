```text
  ██  ██ ██████ ██████ ██  ██
  ██  ██   ██     ██   ██  ██    YouTube in your terminal.
   ████    ██     ██    ████
    ██     ██     ██     ██     ▶ ytty --search 'Me at the zoo'
    ██     ██     ██     ██
```

# ytty

Search and play YouTube in your terminal. On macOS, `ytty-ghostty` can open playback in a new Ghostty window or tab.

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

- `mpv`
- `yt-dlp` 2026.11.23 or newer
- A terminal with Kitty graphics support for `ytty`
- Ghostty 1.3 or newer on macOS for `ytty-ghostty`

Add the checkout's `bin` directory to your `PATH`:

```sh
export PATH="/path/to/ytty/bin:$PATH"
```

## Use

```sh
ytty
ytty --search 'Me at the zoo'
ytty 'https://www.youtube.com/watch?v=jNQXAC9IVRw'
ytty-ghostty --tab --id jNQXAC9IVRw
```

Choose a result by number. Press `m` for the next page, `b` to go back, or `s` for a new search. Press `q` to return from playback, then `q` or Enter at the menu to exit. Use `--logs` with `ytty` to see MPV logs.

Use `--fast` for quicker startup on public videos. It skips cookies and may limit audio options; omit it if playback fails.

For agent use, install `skills/youtube` in your agent's skill directory and make sure `ytty-ghostty` is on its `PATH`.

## Browser cookies (optional)

If YouTube asks you to sign in, select a browser where you're already signed in:

```sh
export YTTY_COOKIES_FROM_BROWSER=firefox
```

Use `chrome`, `safari`, or another browser supported by `yt-dlp`. Applies to playback in both `ytty` and `ytty-ghostty`.
