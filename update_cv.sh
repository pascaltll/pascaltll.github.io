#!/usr/bin/env bash
set -e

SRC="../../proyectos/job-search-tracker/cv-latex/cv_en.pdf"
DEST="assets/cv_en.pdf"

if [ ! -f "$SRC" ]; then
    echo "Error: No se encontró el archivo en $SRC"
    exit 1
fi

cp "$SRC" "$DEST"
echo "✓ PDF copiado."

git add "$DEST"

if git diff --staged --quiet; then
    echo "• El PDF no tiene cambios respecto a la última versión en Git."
else
    git commit -m "chore: actualizar cv_en.pdf"
    git push origin main
    echo "✓ Cambios desplegados en GitHub Pages."
fi
