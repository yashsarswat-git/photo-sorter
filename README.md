# 📸 PhotoSorter

A browser-only photo and video organizer for GitHub Pages.

## What it does
- Reads JPEG EXIF **DateTimeOriginal** when available.
- Falls back to the file modified date when capture metadata is unavailable.
- Supports common photos and videos.
- Recursively scans subfolders.
- Creates date-based folders automatically.
- Copy mode keeps originals; Move mode removes originals only after a successful write.
- Handles duplicate names without overwriting files.
- Nothing is uploaded to a server.

## Important browser limitation
A normal website cannot freely read/write arbitrary folders on a user's computer. This project uses the **File System Access API** in desktop Chrome/Edge, where the user explicitly grants folder access. No external command, Python, Node.js, or download is required for the user.

Firefox/Safari do not provide the same folder-writing API, so direct local-folder organization is intentionally unavailable there.

## GitHub Pages
Put `index.html` in the repository root and enable GitHub Pages from the `main` branch, `/ (root)`.

Then visitors can open the Pages URL and use the app directly.

## Supported media
JPG/JPEG, PNG, TIFF, WebP, HEIC/HEIF, MP4, MOV, M4V, AVI, MKV, WEBM.

Capture-date extraction is implemented for JPEG EXIF. Other formats use the file's modified date unless a future metadata parser is added.

## Security/privacy
The application does not send photos to a backend. Processing and file writes happen in the browser after explicit folder permission.

## License
MIT
