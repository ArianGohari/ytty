---
name: youtube
description: Find YouTube videos and play them in Ghostty on request.
---

Use the user's known interests and the occasion to guide open-ended recommendations before searching. For a specific video, title, or channel, search YouTube directly with flat results:

```sh
yt-dlp --ignore-config --flat-playlist --no-warnings --print '%(id)s | %(title)s | %(channel,uploader|Unknown)s' -- 'ytsearch5:QUERY'
```

Choose using the returned title and channel. Keep `--flat-playlist`: `--skip-download` alone still extracts full details for every result. Use web search only if the results do not identify the requested video or more context is needed. Reuse an already verified video ID without another search. When asked to open a specific video, open the matching result directly instead of presenting a selection first.

Show up to three results by default: `1. **Titel** (Kanal)`. No intro, outro, em dashes, or browser links. Keep the verified video IDs for follow-up; don't print URLs in chat or shell output. If asked for one tip, give one and briefly say why it fits.

Open Ghostty only on request. A valid number alone after the latest YouTube results selects that video for immediate playback. This also applies to `/youtube 1` and `$youtube 1`. Don't ask for confirmation.

```sh
ytty-ghostty --window --id 'VIDEO_ID'
```

Pass the verified ID. Use `--search 'QUERY'` instead of `--id` only when the user asks to browse results in Ghostty. Use `ytty-ghostty --first 'QUERY'` only when the user explicitly asks to search and play the first result immediately. For the first item of an existing list, use its verified ID instead of searching again. Use `ytty-ghostty --resume` only when the user asks to resume saved playback.

### Start at a timestamp or chapter

To play from a given time, use `ytty-ghostty --start=3:20 --id 'VIDEO_ID'`. No chapter lookup is needed. The time sets the starting point; playback continues past it normally. If the user asks to start at a time or chapter in the first search result, resolve that result to an ID before opening it.

For a named chapter, resolve one video first, then read just its chapter metadata. Substitute the verified ID in this command:

```sh
yt-dlp --ignore-config --no-playlist --no-warnings --print '%(chapters)j' --output-na-placeholder '[]' -- 'https://www.youtube.com/watch?v=VIDEO_ID'
```

Match the chapter `title` case-insensitively. For one matching title with a usable `start_time`, pass that time in seconds to `--start=TIME` before `--id`. If more than one chapter matches, show their titles and times and ask which one. If there are no chapters or no match, offer to use a timestamp or to play from the beginning. If the lookup fails, say the chapters could not be loaded. Don't guess a time or start playback as a fallback without the user's request.

### Choose a Ghostty surface

A new, independent selection opens a window by default. Use `--tab` only if requested; it opens a window instead if Ghostty has none. Open a split only if requested: `--split` opens to the right of the calling Ghostty terminal, and `--split=left` opens to its left.

With `--id`, `--first`, or `--resume`, an explicitly opened split returns `Split: PLAYER_TOKEN` on stdout. Remember the token internally with the result list the split was opened from. For a later selection from that same list, use `ytty-ghostty --replace 'PLAYER_TOKEN' --id 'VIDEO_ID'` to switch videos in place. If a start time was requested or resolved from a chapter, put `--start=TIME` before `--id` there too.

Remember the list's split choice even if there is no token. If the token is missing or the split is no longer available, tell the user you can't switch in that split. Open another split, tab, or window only if the user asks for it. Don't reuse the token to start playback for another list or an independent request.

### Control the running split

Use the token of the split opened in this conversation. For a clear request about the running video, use `ytty-ghostty --control 'PLAYER_TOKEN' pause`, `play` to continue, or `seek -20` to go back 20 seconds (`seek +20` to go forward). For "where am I?", use `position` and report the returned seconds as a timestamp. "Resume the saved video" still uses `--resume`; continuing a paused split uses `play`.

If more than one split is a plausible target, ask which one. If the token is missing or the command fails, don't try another player or open anything. Don't print the token in chat.

Fast mode is the default. If YouTube asks you to sign in to confirm you're not a bot, ytty retries once with the configured browser cookies. For other playback failures, worse sound, or a request for standard playback, use `--no-fast` before `--id` or `--search`.
