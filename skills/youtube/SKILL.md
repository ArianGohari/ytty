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

Pass the verified ID. Use `--tab` if requested; if no Ghostty window exists, this opens a new window instead. Use `--search 'QUERY'` instead of `--id` only when the user asks to browse results in Ghostty.

Fast mode is the default. It skips cookies and can select stereo instead of surround sound. If the user asks for normal playback, or if fast mode fails or sounds worse, use `--no-fast` before `--id` or `--search`.
