# 📸 Photo Organizer

[![CI](https://github.com/yashsarswat-git/photo-organizer/actions/workflows/ci.yml/badge.svg)](https://github.com/yashsarswat-git/photo-organizer/actions)
![Python](https://img.shields.io/badge/python-3.10%2B-blue)
![React](https://img.shields.io/badge/react-18-61dafb)
![License](https://img.shields.io/badge/license-MIT-green)

Full-stack app that organises large photo collections into folders by **date taken** and **GPS location**, using the EXIF metadata already embedded in your images - no manual tagging.

**Stack:** Python · FastAPI · Pillow · React · Vite

## Features

- **EXIF-driven** - capture date/time, camera make/model and GPS coordinates
- **Location folders** - GPS to place names offline (optional `reverse_geocoder`), coordinate-grid fallback
- **Custom layouts** - e.g. `{year}/{month}-{month_name}/{place}` or `{camera}/{year}/{month}`
- **Safe by design** - copy mode by default, plan preview before anything moves, one-click undo
- **Duplicate aware** - identical files are skipped, name clashes get `_1`, `_2` suffixes
- **Dashboard** - drag-and-drop upload, stats, charts, searchable plan table, per-photo preview, dark/light theme

## Easiest way: no install

Open `standalone/PhotoSorter.html` in Chrome or Edge, choose your photos folder and a destination, then press **Start**.

## Quick start (full app)

```bash
git clone https://github.com/yashsarswat-git/photo-organizer.git
cd photo-organizer

# Backend  (http://127.0.0.1:8000, docs at /docs)
cd backend
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
uvicorn app.main:app --reload

# Frontend (new terminal, http://localhost:5173)
cd frontend
npm install
npm run dev
```

Optional extras: `pip install reverse_geocoder pillow-heif` for place names and HEIC support.

## API

| Method | Endpoint | Purpose |
|--------|----------|---------|
| POST | `/api/photos/scan` | Plan a sort and return stats |
| POST | `/api/photos/upload` | Upload images into a workspace folder |
| GET | `/api/photos/preview?path=` | Serve an image for preview |
| POST | `/api/organize` | Copy or move photos into the planned folders |
| POST | `/api/organize/undo` | Reverse the last run |
| GET/PUT | `/api/settings` | Default layout, mode, geocoding |

Interactive docs: `http://127.0.0.1:8000/docs`

## Example output

```
sorted/
├── 2023/12-December/No-Location/IMG_0412.jpg
├── 2024/03-March/Delhi, IN/IMG_0988.jpg
└── 2024/07-July/Jaipur, IN/IMG_1204.jpg
```

## Project structure

```
photo-organizer/
├── backend/    FastAPI app: api/ services/ models/ utils/ tests/
├── frontend/   React app: components/ pages/ services/
├── docs/       architecture.md, screenshots/
└── .github/    CI workflow
```

See [docs/architecture.md](docs/architecture.md) for the design.

## Tests

```bash
cd backend && pytest
```

## Roadmap

- Video metadata support · near-duplicate detection (perceptual hash) · map view

## License

MIT © Yash Sarswat
