#!/usr/bin/env bash
# Publishes the project with a clean, professional commit history.
# Usage: ./publish.sh   (create an empty GitHub repo named photo-organizer first)
set -e
REPO="https://github.com/yashsarswat-git/photo-organizer.git"
git init -b main
git add backend/app backend/requirements.txt backend/.env.example backend/pytest.ini
git commit -m "feat(backend): add FastAPI app with EXIF, GPS, geocoding and organizer services"
git add backend/tests
git commit -m "test(backend): add tests for EXIF, GPS and organizer"
git add frontend
git commit -m "feat(frontend): add React dashboard, photos and settings pages"
git add standalone
git commit -m "feat: add standalone no-install browser app"
git add .github docs
git commit -m "ci: add CI workflow and architecture docs"
git add -A
git commit -m "docs: add README, license, changelog and contributing guide"
git tag -a v1.0.0 -m "Photo Organizer v1.0.0"
git remote add origin "$REPO"
git push -u origin main --tags
