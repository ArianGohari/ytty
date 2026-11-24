# ytty

Search and play YouTube in your terminal at the best available quality. On macOS, `ytty-ghostty` can open playback in a new Ghostty window or tab.

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
ytty --search 'Ninja Nerd Cell Junctions'
ytty 'YOUTUBE_URL'
ytty-ghostty --tab --id gmlA8V2zMv4
```

Choose a result by number. Press `m` for the next page, `b` to go back, or `s` for a new search. Press `q` to return from playback, then `q` or Enter at the menu to exit. Use `--logs` with `ytty` to see MPV logs.

For agent use, install `skills/youtube` in your agent's skill directory and make sure `ytty-ghostty` is on its `PATH`.

## Browser cookies (optional)

If YouTube asks you to sign in, select a browser where you're already signed in:

```sh
export YTTY_COOKIES_FROM_BROWSER=firefox
```

Use `chrome`, `safari`, or another browser supported by `yt-dlp`. Applies to playback in both `ytty` and `ytty-ghostty`.
