# GTA Clone Mobile (Godot 4)

Minimal prototype set up for mobile + web. Includes Web export + GitHub Pages workflow.

## Play via link (GitHub Pages)
1. Create a new GitHub repository and push this project:
   - Initialize git, commit, and push to `main`.
2. Open Repository Settings → Pages.
   - Set Source to "GitHub Actions" if prompted.
3. Push to `main`. The workflow `.github/workflows/deploy-web.yml` will build and deploy.
4. Your game URL will be:
   - `https://<your-username>.github.io/<repo-name>/`

## Local export (optional)
- Install Godot 4.2+ with export templates.
- From the project root run:
  ```bash
  godot --headless --path . --export-release "Web" web/index.html
  npx http-server web -p 8080
  ```
- Open `http://localhost:8080`.

## Notes
- Main scene: `scenes/Main.tscn`
- Web export preset: `export_presets.cfg` (preset name: Web)
- Touch controls placeholder in `scenes/UI.tscn` and `scripts/ui_mobile.gd`.