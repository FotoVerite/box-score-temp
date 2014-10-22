boxscore
========

Box Score App

### Development Setup

1. Install rbenv-vars rbenv plugin

    `brew install rbenv-vars`

2. Add env vars to your .rbenv-vars file:
    ```bash
    # Required - for akismet spam filtering
    RAKISMET_KEY=0123456789ab
    RAKISMET_URL=http://localhost:3000

    # Optional - for social media
    GOOGLE_PLUS=https://plus.google.com/+nycgov/
    FACEBOOK=https://www.facebook.com/pages/New-York-New-York/108424279189115
    ```
