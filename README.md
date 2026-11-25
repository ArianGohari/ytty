```text
  ██  ██ ██████ ██████ ██  ██
  ██  ██   ██     ██   ██  ██    YouTube in your terminal.
   ████    ██     ██    ████
    ██     ██     ██     ██     ▶ ytty --search 'Me at the zoo'
    ██     ██     ██     ██
```

# ytty

Search and play YouTube in your terminal. On macOS, `ytty-ghostty` can open playback in a Ghostty window, tab, or split.

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
ytty --first 'Me at the zoo'
ytty --resume
ytty 'https://www.youtube.com/watch?v=jNQXAC9IVRw'
ytty-ghostty --start=0:10 --id jNQXAC9IVRw
ytty-ghostty --tab --id jNQXAC9IVRw
ytty-ghostty --split --id jNQXAC9IVRw
```

`--first` skips the search menu. `--resume` opens the last YouTube video that loaded, at the position mpv saved when it quit. Use `--start=TIME` to jump to a specific time instead. `ytty-ghostty` accepts all three options.

`ytty-ghostty` opens a window by default. From Ghostty, use `--split` to open the player on the right or `--split=left` to open it on the left. The split opens next to the terminal that ran the command, even if you've switched focus. For direct playback, the launcher prints `Split: PLAYER_TOKEN`. Use `ytty-ghostty --replace PLAYER_TOKEN --id VIDEO_ID` to change the video without opening another split.

Use `ytty-ghostty --control PLAYER_TOKEN pause` to pause from the calling terminal, and `play` to continue. `seek -20` jumps back 20 seconds; `seek +20` jumps forward. `position` prints the current position in seconds. These commands don't change focus or open a new player.

Choose a result by number. Press `m` for the next page, `b` to go back, or `s` for a new search. Press `q` to return from playback, then `q` or Enter at the menu to exit. Use `--logs` with `ytty` to see MPV logs.

Fast mode is the default in `ytty` and `ytty-ghostty`. It starts without cookies and may play stereo instead of surround sound. Try `--no-fast` for other playback errors or if you expected surround sound.

For agent use, install `skills/youtube` in your agent's skill directory and make sure `ytty-ghostty` is on its `PATH`. The skill opens a window unless you ask for a tab or split.

## Browser cookies (optional)

Select a browser where you're already signed in to YouTube. If YouTube asks you to sign in to confirm you're not a bot, fast mode retries once with that browser's cookies. `--no-fast` uses them on the first attempt:

```sh
export YTTY_COOKIES_FROM_BROWSER=firefox
```

Use `chrome`, `safari`, or another browser supported by `yt-dlp`. Applies to playback in both `ytty` and `ytty-ghostty`.
