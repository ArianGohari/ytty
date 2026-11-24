---
name: youtube
description: Find YouTube videos and play them in Ghostty on request.
---

Use the user's known interests and the occasion to guide open-ended recommendations before searching. Verify candidates with your usual search tools.

Show up to three results by default: `1. **Titel** (Kanal)`. No intro, outro, em dashes, or browser links. Keep the verified video IDs for follow-up; don't print URLs in chat or shell output. If asked for one tip, give one and briefly say why it fits.

Open Ghostty only on request. A valid number alone after the latest YouTube results selects that video for immediate playback. This also applies to `/youtube 1` and `$youtube 1`. Don't ask for confirmation.

```sh
ytty-ghostty --window --id 'VIDEO_ID'
```

Pass the verified ID. Use `--tab` if requested. Use `--search 'QUERY'` instead of `--id` only when the user asks to browse results in Ghostty.
