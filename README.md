# action-semgrep

[![Test](https://github.com/g-wilson/action-semgrep/workflows/Test/badge.svg)](https://github.com/g-wilson/action-semgrep/actions?query=workflow%3ATest)
[![reviewdog](https://github.com/g-wilson/action-semgrep/workflows/reviewdog/badge.svg)](https://github.com/g-wilson/action-semgrep/actions?query=workflow%3Areviewdog)
[![depup](https://github.com/g-wilson/action-semgrep/workflows/depup/badge.svg)](https://github.com/g-wilson/action-semgrep/actions?query=workflow%3Adepup)
[![release](https://github.com/g-wilson/action-semgrep/workflows/release/badge.svg)](https://github.com/g-wilson/action-semgrep/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/g-wilson/action-semgrep?logo=github&sort=semver)](https://github.com/g-wilson/action-semgrep/releases)
[![action-bumpr supported](https://img.shields.io/badge/bumpr-supported-ff69b4?logo=github&link=https://github.com/haya14busa/action-bumpr)](https://github.com/haya14busa/action-bumpr)

![github-pr-review demo](https://user-images.githubusercontent.com/3797062/73162963-4b8e2b00-4132-11ea-9a3f-f9c6f624c79f.png)
![github-pr-check demo](https://user-images.githubusercontent.com/3797062/73163032-70829e00-4132-11ea-8481-f213a37db354.png)

## Usage

```yaml
name: reviewdog-semgrep
on: [pull_request]
jobs:
  # TODO: change `linter_name`.
  linter_name:
    name: runner / <linter_name>
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: g-wilson/action-semgrep@v1
        with:
          github_token: ${{ secrets.github_token }}
          # Change reviewdog reporter if you need [github-pr-check,github-check,github-pr-review].
          reporter: github-pr-review
          # Change reporter level if you need.
          # GitHub Status Check won't become failure with warning.
          level: warning
```
