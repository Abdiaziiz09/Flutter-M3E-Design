# Publishing this documentation

Repository owner, name, and deployment URL are intentionally not guessed. Replace placeholders only after the project has an actual GitHub remote.

## GitHub repository

1. Create or select the intended public repository and review the license, citation, conduct, and security contact policies.
2. Replace `OWNER/REPOSITORY` in `CITATION.cff` with the real canonical repository path.
3. Push the repository and ensure the **Documentation validation** workflow succeeds on the default branch.
4. Enable GitHub Pages using GitHub Actions if publishing the generated MkDocs site.

## GitHub Pages workflow

The current workflow validates documentation and Flutter examples; it does not deploy Pages. To enable deployment, add a separate workflow using the official MkDocs Material publishing guidance and the repository's configured Pages environment. Grant only required `contents: read` and `pages: write` / `id-token: write` permissions, use pinned or reviewed action versions, and deploy from the default branch. Do not hard-code a guessed site URL into docs.

Build locally with:

```bash
python -m pip install -r requirements.txt
mkdocs build --strict
```

The generated `site/` directory is ignored by Git and should be deployed by the chosen CI workflow, not committed as source.
