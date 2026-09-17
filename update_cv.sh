#!/usr/bin/env bash
set -e

SRC="../../proyectos/job-search-tracker/cv-latex/cv_en.pdf"
DEST="assets/cv_en.pdf"

if [ -f "$SRC" ]; then
    cp "$SRC" "$DEST"
    echo "✓ PDF copiado con éxito."
    
    git add "$DEST"
    git commit -m "chore: actualizar cv_en.pdf"
    git push origin main
    echo "✓ Cambios desplegados en GitHub Pages."
else
    echo "Error: No se encontró el archivo en $SRC"
    exit 1
fi
