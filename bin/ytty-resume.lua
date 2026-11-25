local mp = require "mp"
local msg = require "mp.msg"
local utils = require "mp.utils"
local last_video = os.getenv("YTTY_LAST_VIDEO_FILE")

local function is_youtube_video(url)
    local host, path = url:match("^https?://([^/]+)(/[^%s%c]*)$")
    if not host then return false end

    local id
    if host == "youtu.be" then
        id = path:match("^/([^/?#]+)")
    elseif host == "youtube.com" or host == "www.youtube.com" or host == "m.youtube.com" then
        local query = path:match("^/watch%?([^#]*)")
        if query then
            id = ("&" .. query):match("&v=([^&]+)")
        else
            id = path:match("^/shorts/([^/?#]+)") or path:match("^/live/([^/?#]+)")
                or path:match("^/embed/([^/?#]+)")
        end
    end
    return id and #id == 11 and id:match("^[A-Za-z0-9_-]+$") ~= nil
end

if last_video then
    mp.register_event("file-loaded", function()
        local url = mp.get_property("path", "")
        if not is_youtube_video(url) then return end

        -- Keep the exact mpv Watch Later key for legacy direct URLs as well.
        local temp = last_video .. "." .. utils.getpid() .. ".tmp"
        local file = io.open(temp, "w")
        if file then
            local written = file:write(url, "\n")
            local closed = file:close()
            if written and closed and os.rename(temp, last_video) then return end
            os.remove(temp)
        end
        msg.error("Could not save the last YouTube video.")
    end)
end
